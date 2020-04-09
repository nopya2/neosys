<?php
namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use App\Entity\User;
use App\Entity\Service;
use App\Entity\Projet;
use App\Entity\Blog;
use App\Entity\Evenement;
use App\Form\UserType;
use App\Repository\UserRepository;
use App\Repository\ServiceRepository;
use App\Repository\ProjetRepository;
use App\Repository\ConfigurationRepository;
use App\Repository\BlogRepository;
use App\Repository\PartenaireRepository;
use App\Repository\EvenementRepository;
use App\Repository\SliderRepository;

class PortailController extends AbstractController {

    /**
     * @Route("/", name="home")
     */
    public function index(Request $request, UserRepository $userRepository, ServiceRepository $serviceRepository, 
        ProjetRepository $projetRepository, BlogRepository $blogRepos, SliderRepository $sliderRepos
    ) {

        $nbrUsers = count($userRepository->findAll());
        $nbrServices = count($serviceRepository->findAll());
        $nbrProjets = count($projetRepository->findAll());
        $services = $serviceRepository->findAll();
        $blogs = $blogRepos->findRecentsPosts(5);
        $projets = $projetRepository->findLastRecentsProjets(6);
        $utilisateurs = $userRepository->findAll();
        $sliders = $sliderRepos->findVisibleSlidersByPriorite(5);

        $currentYear = date('Y');
        $annee = $currentYear - 2014;


        return $this->render('portail/home.html.twig', array(
            'nbrUsers' => $nbrUsers,
            'nbrServices' => $nbrServices,
            'nbrProjets' => $nbrProjets,
            'services' => $services,
            'blogs' => $blogs,
            'projets' => $projets,
            'utilisateurs' => $utilisateurs,
            'sliders' => $sliders,
            'annee' => $annee,
        	'page' => 'home',
        ));
    }

    /**
     * @Route("/apropos", name="apropos")
     */
    public function about(UserRepository $userRepository ) {
        $utilisateurs = $userRepository->findUserTeam();

        return $this->render('portail/apropos.html.twig', array(
            'page' => 'apropos',
            'utilisateurs' => $utilisateurs
        ));
    }

    /**
     * @Route("/services", name="services")
     */
    public function services(ServiceRepository $serviceRepos ) {
        $services = $serviceRepos->findVisibleServices();

        return $this->render('portail/page/service/index.html.twig', array(
            'page' => 'service',
            'services' => $services
        ));
    }

    /**
     * @Route("/services/{id}", name="service_details", methods="GET")
     */
    public function service(Service $service, ServiceRepository $serviceRepos, 
        ConfigurationRepository $configurationRepos
    ) {
        $configuration = $configurationRepos->find(1);
        $services = $serviceRepos->findVisibleServices();

        return $this->render('portail/page/service/details.html.twig', array(
            'page' => 'service_details',
            'service' => $service,
            'services' => $services,
            'configuration' => $configuration
        ));
    }

    /**
     * @Route("/projets", name="projets")
     */
    public function projets(ProjetRepository $projetRepos, ServiceRepository $serviceRepos) {
        $services = $serviceRepos->findVisibleServices();
        $projets = $projetRepos->findVisibleProjets();

        return $this->render('portail/page/projet/index.html.twig', array(
            'page' => 'projet',
            'services' => $services,
            'projets' => $projets
        ));
    }

    /**
     * @Route("/projets/{id}", name="projet_details")
     */
    public function projet(Projet $projet) {

        return $this->render('portail/page/projet/details.html.twig', array(
            'page' => 'projet_details',
            'projet' => $projet
        ));
    }

    /**
     * @Route("/actualites", name="actualites")
     */
    public function actualites(BlogRepository $blogRepos) {
        $blogs = $blogRepos->findVisibleBlogs();

        return $this->render('portail/page/blog/index.html.twig', array(
            'page' => 'actualite',
            'blogs' => $blogs,
        ));
    }

    /**
     * @Route("/actualites/{id}", name="actualite_details")
     */
    public function actualite(Blog $blog, BlogRepository $blogRepos, ProjetRepository $projetRepos) {
        $previousBlog = $blogRepos->getPreviousBlog($blog->getId());
        $nextBlog = $blogRepos->getNextBlog($blog->getId());
        $projets = $projetRepos->findRecentsProjets(4);
        $blogs = $blogRepos->findRecentsPosts(4);

        return $this->render('portail/page/blog/details.html.twig', array(
            'page' => 'actualite_details',
            'blog' => $blog,
            'previousBlog' => $previousBlog,
            'nextBlog' => $nextBlog,
            'projets' => $projets,
            'blogs' => $blogs
        ));
    }

    /**
     * @Route("/evenements", name="evenements")
     */
    public function evenements(EvenementRepository $evenementRepos) {
        $evenements = $evenementRepos->findRecentEvenements(10);

        return $this->render('portail/page/evenement/index.html.twig', array(
            'page' => 'evenement',
            'evenements' => $evenements,
        ));
    }

    /**
     * @Route("/evenements/{id}", name="evenement_details")
     */
    public function evenement(Evenement $evenement, BlogRepository $blogRepos, ProjetRepository $projetRepos) {

        return $this->render('portail/page/evenement/details.html.twig', array(
            'page' => 'evenement_details',
            'evenement' => $evenement,
        ));
    }

    /**
     * @Route("/contacts", name="contacts")
     */
    public function contacts(ConfigurationRepository $configurationRepos) {
        $configuration = $configurationRepos->find(1);

        return $this->render('portail/page/contact/index.html.twig', array(
            'page' => 'contact',
            'configuration' => $configuration
        ));
    }
    
    public function topBar(ConfigurationRepository $configurationRepos) {
        $configuration = $configurationRepos->find(1);

        return $this->render('portail/include/_topbar.html.twig', array(
            'configuration' => $configuration
        ));
    }

    public function bottom(ConfigurationRepository $configurationRepos, BlogRepository $blogRepos, $max) {
        $configuration = $configurationRepos->find(1);
        $blogs = $blogRepos->findRecentsPosts(3);

        return $this->render('portail/include/_bottom.html.twig', array(
            'configuration' => $configuration,
            'blogs' => $blogs
        ));
    }

    public function partenaires(PartenaireRepository $partenaireRepos) {
        $partenaires = $partenaireRepos->findAll();

        return $this->render('portail/include/_partenaire.html.twig', array(
            'partenaires' => $partenaires
        ));
    }

    public function footer(ConfigurationRepository $configurationRepos) {
        $currentDate = new \DateTime();

        return $this->render('portail/include/_footer.html.twig', array(
            'currentDate' => $currentDate
        ));
    }

}