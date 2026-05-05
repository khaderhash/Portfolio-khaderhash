final List<Map<String, dynamic>> projectsData = [
  {
    "title": "Khadamati",
    "role": "Lead Flutter Developer",
    "leadRole":
        "Lead Flutter Developer for a full-stack university services platform centralizing student operations, housing, finance, maintenance, complaints, transport, and notifications.",
    "achievements": [
      "Validated core request workflows, measured by automated unit, widget, and integration tests, by covering authentication, request submission, finance boundaries, and role-aware UI states.",
      "Protected finance behavior, measured by automated checks around SYP-only wallet operations and the -25000 SYP debt threshold, by testing serializer validation and transaction rules.",
      "Hardened permission-sensitive flows, measured by tests for subservice-only requests, assigned-room maintenance access, and confidential complaint routing, by exercising backend rules through API-level scenarios.",
      "Reduced release risk, measured by CI/CD checks before deployment, by wiring Khadamati builds, analysis, and test execution into the delivery pipeline.",
    ],
    "devOpsQa":
        "DevOps & QA: Automated unit, widget, and integration tests across mobile/API flows; CI/CD pipeline for build, analysis, and test execution before release.",
    "architecture":
        "Tech Stack & Architecture: Django REST Framework, SimpleJWT, PostgreSQL, Docker Compose, Flutter, Dart, Django Admin, Clean API boundaries, serializer-driven validation.",
    "desc":
        "Lead full-stack architecture for a role-aware university services platform with wallet, housing, maintenance, complaints, transport, and notification workflows.",
    "tech": ["Flutter", "Django REST", "JWT", "PostgreSQL"],
    "image": "web/khadamati.jpg",
  },
  {
    "title": "Nibrass Hub",
    "role": "Lead Flutter Developer",
    "leadRole":
        "Lead Flutter Developer for an API-first university super-app built around Clean Architecture, GetX, finance tracking, transport operations, and RAG AI assistance.",
    "achievements": [
      "Digitized student-service access, measured by unified housing, transport, and finance workflows, by building a Flutter application with separated Presentation, Domain, and Data layers.",
      "Reduced manual support effort, measured by real-time answers for housing and finance queries, by integrating a RAG chatbot using n8n workflows and Gemini.",
      "Improved API reliability, measured by secure authenticated mobile sessions, by implementing JWT flows, Dio interceptors, and clean request handling.",
    ],
    "architecture":
        "Tech Stack & Architecture: Flutter, Dart, GetX, Clean Architecture, Django REST Framework, RAG AI, n8n, Gemini, JWT.",
    "desc":
        "Smart University App. Integrated RAG AI Chatbot (n8n & Gemini) & Real-time Finance/Transport tracking.",
    "tech": ["Flutter", "GetX", "RAG AI", "Django"],
    "github": "https://github.com/khaderhash/nibrass",
    "image": "assets/nibrass.png",
    "video": "https://youtu.be/Rk9tBVoOixY",
  },
  {
    "title": "Smart Telegram Bot",
    "role": "Automation Developer",
    "leadRole":
        "Automation Developer for a customer-support automation workflow that connects Telegram conversations with structured complaint logging.",
    "achievements": [
      "Automated support intake, measured by instant Telegram query handling, by designing n8n workflows around Telegram API events.",
      "Improved operational visibility, measured by complaint and feedback records in Google Sheets, by mapping bot responses into structured admin-ready logs.",
      "Streamlined customer communication, measured by consistent animated responses, by building JSON-based routing and response flows.",
    ],
    "architecture":
        "Tech Stack & Architecture: n8n, Telegram API, Google Sheets API, JSON, webhook automation.",
    "desc":
        "Automated Customer Support Bot. Handles queries & logs complaints to Google Sheets via n8n workflows.",
    "tech": ["n8n", "Telegram API", "Automation"],
    "image": "assets/bot.png",
  },
  {
    "title": "WhatsApp Automation Bot",
    "role": "Automation Developer",
    "leadRole":
        "Automation Developer for a Node.js communication assistant focused on customer inquiries and repeatable response workflows.",
    "achievements": [
      "Accelerated customer response handling, measured by automated inquiry replies, by building a Node.js WhatsApp automation service.",
      "Reduced repetitive manual communication, measured by reusable conversation flows, by implementing structured message handling logic.",
      "Supported business workflow consistency, measured by predictable responses across common cases, by separating automation rules from communication execution.",
    ],
    "architecture":
        "Tech Stack & Architecture: Node.js, WhatsApp automation, workflow scripting, API-based messaging.",
    "desc":
        "Node.js automation bot that handles customer inquiries, provides instant responses, and streamlines communication workflows.",
    "tech": ["Node.js", "WhatsApp", "Automation"],
    "image": "assets/wh_bot.png",
  },

  {
    "title": "Lumi Rewards",
    "role": "Flutter Developer & Product Contributor",
    "leadRole":
        "Flutter Developer & Product Contributor for Lumi Rewards, contributing to both Flutter delivery and product evolution through user interviews, workflow simplification, and feedback-driven performance improvements.",
    "achievements": [
      "Ensured production stability, measured by 70%+ test coverage on core business logic, by implementing unit, widget, and integration tests for vendor workflows and reward operations.",
      "Reduced release risk, measured by repeatable CI/CD builds, by configuring GitHub Actions/Codemagic pipelines for analysis, tests, and deployable Flutter artifacts.",
      "Improved vendor workflow quality, measured by fewer ambiguous interaction paths during manual review, by interviewing users and simplifying menu, offer, QR, and reward-management flows.",
      "Improved runtime responsiveness, measured by smoother navigation through merchant and QR workflows, by optimizing GetX state boundaries, rebuild scope, and screen-level performance.",
    ],
    "devOpsQa":
        "DevOps & QA: 70%+ coverage on core business logic with unit/widget/integration tests; GitHub Actions/Codemagic pipeline for Flutter analysis, tests, and release builds.",
    "architecture":
        "Tech Stack & Architecture: Flutter, Dart, GetX, Clean Architecture, QR workflows, REST integration, CI/CD, performance optimization.",
    "desc":
        "B2B loyalty app shaped through Flutter delivery, user feedback, workflow simplification, and performance optimization.",
    "tech": ["Flutter", "GetX", "Clean Arch", "QR Code"],
    "behance": "https://www.behance.net/gallery/238527685/LUMI-REWARDS",
    "image": "assets/lumilogo.jpeg",
    "video": "https://youtube.com/shorts/boKRrkg6N58?feature=share",
  },

  {
    "title": "UniVerse",
    "role": "Lead Flutter Developer",
    "leadRole":
        "Lead Flutter Developer for a university assistant combining Clean Architecture, GetX, real-time tracking, and LLM-powered scheduling.",
    "achievements": [
      "Verified Clean Architecture boundaries, measured by automated tests around controllers, repositories, and use-case behavior, by separating presentation, domain, and data responsibilities.",
      "Tested AI scheduling behavior, measured by covered input/output cases for GPA, prerequisite, and negotiation flows, by validating n8n/Gemini integration responses against expected app states.",
      "Stabilized real-time tracking, measured by integration coverage for bus-location updates and map state changes, by testing Socket.IO data flow into Flutter UI state.",
      "Reduced delivery risk, measured by CI/CD validation before builds, by configuring automated analysis, tests, and Flutter build steps for UniVerse.",
    ],
    "devOpsQa":
        "DevOps & QA: Unit, widget, and integration tests for Clean Architecture modules, AI scheduling, auth, and real-time tracking; CI/CD pipeline for analysis, tests, and Flutter builds.",
    "architecture":
        "Tech Stack & Architecture: Flutter, Dart, GetX, Clean Architecture, n8n, Gemini, Socket.IO, OpenStreetMap, FCM, JWT, NestJS.",
    "desc":
        "AI-Powered University Assistant. Automated scheduling & Real-time bus tracking.",
    "tech": ["Flutter", "GetX", "n8n", "Gemini"],
    "behance": "https://www.behance.net/gallery/241792513/UniVerse",
    "image": "assets/universelogo.png",
    "video": "https://youtu.be/6jKZEwRWwDo",
  },

  {
    "title": "Learning Platform",
    "role": "Flutter Developer",
    "leadRole":
        "Flutter Developer for a cross-platform e-learning app focused on structured learning flows and maintainable app architecture.",
    "achievements": [
      "Built a scalable education app, measured by reusable cross-platform screens, by developing the Flutter application around MVVM principles.",
      "Improved learning content access, measured by organized student-facing workflows, by separating UI state, models, and service communication.",
      "Supported future feature growth, measured by maintainable module boundaries, by applying consistent architecture and state management patterns.",
    ],
    "architecture":
        "Tech Stack & Architecture: Flutter, Dart, MVVM, REST integration, education workflows.",
    "desc": "Cross-platform E-learning app. Scalable MVVM architecture.",
    "tech": ["Flutter", "MVVM", "Education"],
    "behance":
        "https://www.behance.net/gallery/234016951/learning-app-for-student",
    "github": "https://github.com/khaderhash/learning-app2",
    "image": "assets/learning.png",
  },

  {
    "title": "Expen Scope (EXS)",
    "role": "Lead Flutter Developer",
    "leadRole":
        "Lead Flutter Developer for a dual-personality financial assistant serving business and individual finance workflows with AI automation.",
    "achievements": [
      "Designed a flexible finance assistant, measured by separate business and individual experiences, by building a dual-personality product model.",
      "Delivered a full-stack product, measured by connected Flutter and Laravel workflows, by implementing the mobile frontend, backend integration, and deployment pipeline.",
      "Enhanced financial workflows, measured by AI-assisted operations, by integrating n8n automation with Google Gemini API.",
    ],
    "architecture":
        "Tech Stack & Architecture: Flutter, Dart, Laravel, n8n, Gemini, REST APIs, CI/CD.",
    "desc":
        "Dual-personality financial assistant (Business/Individual) with AI-driven workflows.",
    "tech": ["Flutter", "n8n", "Laravel"],
    "behance":
        "https://www.behance.net/gallery/231325481/Exs-A-smart-financial",
    "image": "assets/exslogo.png",
    "video": "https://youtu.be/tZjbgxo0VO0",
  },
  {
    "title": "Abo Najib",
    "role": "Flutter Developer",
    "leadRole":
        "Flutter Developer for a personal finance management app supporting online and offline expense workflows.",
    "achievements": [
      "Built a practical finance app, measured by offline and online expense management, by developing Flutter features integrated with a Laravel backend.",
      "Improved user finance tracking, measured by structured income and expense flows, by applying MVC-backed service boundaries.",
      "Supported maintainability, measured by separated mobile and backend responsibilities, by keeping Flutter presentation and Laravel business logic distinct.",
    ],
    "architecture":
        "Tech Stack & Architecture: Flutter, Dart, Laravel, MVC, REST APIs, offline-first finance workflows.",
    "desc":
        "Financial management app (Offline & Online). Built with Flutter & Laravel (MVC).",
    "tech": ["Flutter", "Laravel", "MVC"],
    "behance":
        "https://www.behance.net/gallery/223675637/Abo-Najib-Personal-Finance-Expense-Management-App",
    "github": "https://github.com/khaderhash/Abo_Najib_front",
    "image": "assets/abonajib.png",
    "video": "https://youtu.be/nH-WDZCMdpk",
  },

  {
    "title": "SSSD Mobile App",
    "role": "Flutter Developer",
    "leadRole":
        "Flutter Developer for a digital transformation app supporting NGO service requests, communication, and news delivery.",
    "achievements": [
      "Digitized NGO service access, measured by mobile request submission, by building Flutter workflows connected to REST APIs.",
      "Improved beneficiary communication, measured by centralized news and service updates, by implementing a structured mobile content experience.",
      "Supported operational clarity, measured by separated request and content flows, by organizing features around clean mobile modules.",
    ],
    "architecture":
        "Tech Stack & Architecture: Flutter, Dart, REST APIs, service-request workflows, NGO operations.",
    "desc":
        "Digital transformation for Syrian Society for Social Development. Features service requests & news feed.",
    "tech": ["Flutter", "REST API", "NGO Tech"],
    "image": "assets/sssd.png",
  },
  {
    "title": "مؤسسة دعم وحماية حقوق المواطنين المقيمين في الخارج",
    "label": "Secure Project",
    "role": "Lead Developer",
    "leadRole":
        "Lead Developer for a secure legal-support and legal-automation platform dedicated to rights protection and service access for citizens living abroad.",
    "achievements": [
      "Verified full-stack legal intake reliability, measured by automated tests covering request validation, form submission, routing behavior, and user-facing response states.",
      "Hardened form handling, measured by tests for required fields, invalid payloads, and abuse-resistant submission paths, by validating Laravel request rules and controller behavior.",
      "Protected Arabic-first service flows, measured by tested RTL navigation and legal-support content paths, by covering frontend states and backend responses together.",
      "Reduced regression risk, measured by repeatable test execution across backend and interface changes, by adding automated coverage for the Laravel site’s critical workflows.",
    ],
    "devOpsQa":
        "DevOps & QA: Automated Laravel feature/unit tests plus interface-level checks for legal intake, validation, routing, and RTL service flows.",
    "architecture":
        "Tech Stack & Architecture: Laravel, MySQL, Railway, RTL interface, secure legal-intake flows, hardened form handling, production web deployment.",
    "desc":
        "Secure legal automation and rights-protection platform for citizens residing abroad.",
    "tech": ["Laravel", "Security", "RTL", "Railway"],
    "website": "https://syru-legal.up.railway.app/ar",
    "image": "assets/secure_project_placeholder.jpg",
  },
];
