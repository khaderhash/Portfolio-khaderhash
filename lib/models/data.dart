// Project data — split into two tiers so production systems are not
// visually flattened against personal and academic work.
//
// Fields:
//   tier        — 'production' (live/deployed systems I build AND operate)
//                 or 'other' (product, academic, and personal work)
//   image       — screenshot path OR brand-mark path
//   logo        — when present, render as a contained brand mark over a
//                 tinted backdrop (instead of cover-cropping image)
//   brandColor  — accent color for the brand-mark backdrop (hex int)
//   badges      — short status pills shown on card (max 2 render)
//   outcome     — one-line, outcome-led summary shown above description
//
final List<Map<String, dynamic>> projectsData = [
  // ═════════════════════════════════════════════════════════════
  // PRODUCTION SYSTEMS — built, deployed, and operated by me
  // ═════════════════════════════════════════════════════════════

  // ─────────────────────────────────────────────────────────────
  // 1. WeinKorsi — Founder, sole engineer, production marketplace
  // ─────────────────────────────────────────────────────────────
  {
    "tier": "production",
    "title": "WeinKorsi",
    "schemaType": "SoftwareApplication",
    "role": "Founder & Full-Stack Engineer",
    "cardBadges": ["Founder", "Live Production"],
    "badges": ["Founder", "Full Stack", "Live Production", "Marketplace"],
    "outcome":
        "Educational marketplace I founded and run — 12 training institutes onboarded and 100+ registered users since launch.",
    "leadRole":
        "Founder and sole engineer of WeinKorsi — owning product strategy, system architecture, frontend, backend, infrastructure, security, deployment, and day-to-day operations.",
    "achievements": [
      "In production since launch: 12 training institutes onboarded and 100+ registered users.",
      "Founded the venture and built the product: field market research, then personally pitched and onboarded 12 training institutes before the full technical build.",
      "React frontend, Laravel REST API, and a companion Flutter mobile app with role-based access for students, institutes, and administrators.",
      "OTP authentication, authorization middleware, rate limiting, and Arabic RTL course discovery, filtering, and reservation flows.",
      "Runs on a self-managed VPS behind Nginx — provisioning, HTTPS/TLS, migrations, scheduled jobs, automated backups, and uptime monitoring are all mine.",
    ],
    "architecture":
        "Stack & Architecture: React (Vite), Laravel 12, Flutter, PostgreSQL, Cloudflare R2, VPS (Nginx). Role-based access control, OTP authentication, REST API, scoped admin dashboards, Arabic RTL interfaces.",
    "desc":
        "Educational marketplace I founded and run — connecting students, institutes, and providers under a multi-role architecture.",
    "tech": ["React", "Laravel", "PostgreSQL", "VPS"],
    "website": "https://www.wein-korsi.com/",
    "image": "assets/weinkorsi_logo.png",
    "logo": true,
    "brandColor": 0xFF1F3A2A,
  },

  // ─────────────────────────────────────────────────────────────
  // 2. EduPal — operational system at Al Sham Private University
  // ─────────────────────────────────────────────────────────────
  {
    "tier": "production",
    "title": "EduPal",
    "schemaType": "SoftwareApplication",
    "role": "Sole Full-Stack Engineer",
    "cardBadges": ["Live Production", "Sole Engineer"],
    "badges": ["Live Production", "Sole Engineer", "Full Stack"],
    "outcome":
        "The operational system Al Sham Private University adopted for its student housing department — serving 100+ students plus housing staff and managers.",
    "leadRole":
        "Sole Full-Stack Engineer for EduPal — mobile app, web dashboard, and backend delivered single-handedly, then deployed and operated on my own VPS infrastructure.",
    "achievements": [
      "Adopted by Al Sham Private University as the operational system for its student housing department, serving 100+ students plus housing staff and managers.",
      "Delivered the mobile app, web dashboard, and backend single-handedly for students, housing staff, maintenance teams, and administrators.",
      "Digitized the university's student housing operation: room assignments, contracts, deposits, room inventory, and payment tracking.",
      "Dual-wallet finance system with a real-time ledger handling live student balances, deposits, and deductions.",
      "Deployed and operated on a self-managed VPS behind Nginx, with HTTPS/TLS, automated backups, and uptime monitoring.",
    ],
    "devOpsQa":
        "DevOps: Self-managed VPS with Nginx, HTTPS/TLS, database migrations, scheduled jobs, automated backups, and uptime monitoring — no separate ops layer.",
    "architecture":
        "Stack & Architecture: Flutter, GetX, Clean Architecture, PostgreSQL, JWT, VPS (Nginx). Role-aware data model, REST API, dual-wallet ledger, multi-role dashboards.",
    "desc":
        "University services platform in daily operational use at Al Sham Private University's student housing department.",
    "tech": ["Flutter", "GetX", "PostgreSQL", "VPS"],
    "website": "https://edu-pal.tech/",
    "image": "assets/edupal_logo.png",
    "logo": true,
    "brandColor": 0xFF1F2E6E,
  },

  // ─────────────────────────────────────────────────────────────
  // 3. Citizens Abroad — legal foundation platform (on Railway)
  // ─────────────────────────────────────────────────────────────
  {
    "tier": "production",
    "title": "Citizens Abroad — Legal Support Platform",
    "schemaType": "WebSite",
    "schemaName":
        "Foundation for the Support & Protection of Citizens Abroad",
    "label": "Secure Project",
    "role": "Backend Developer & Maintainer",
    "cardBadges": ["Live Production", "Security"],
    "badges": ["Live Production", "Security", "Backend"],
    "outcome":
        "Bilingual Arabic/Russian platform for a non-profit legal advisory foundation — built in one month, maintained in production since, ~500 monthly visitors.",
    "leadRole":
        "Backend Developer and maintainer of the public platform of a non-profit legal advisory foundation serving Russian nationals in Syria.",
    "achievements": [
      "Built in one month and maintained in production since, serving ~500 monthly visitors.",
      "Built and continue to maintain the public platform of a non-profit legal advisory foundation serving Russian nationals in Syria.",
      "Bilingual Arabic/Russian interface with full RTL and Cyrillic support, plus a consultation request workflow routed to the legal team.",
      "Bot and abuse protection through Cloudflare Turnstile, honeypot fields, and strict security headers.",
    ],
    "devOpsQa":
        "DevOps: Hosted on Railway. Hardened request handling, strict security headers, and abuse-resistant intake paths.",
    "architecture":
        "Stack & Architecture: Laravel 11, Cloudflare Turnstile, Brevo API, Railway. Bilingual Arabic/Russian interface with RTL and Cyrillic support, consultation request routing, hardened form handling.",
    "desc":
        "Bilingual Arabic/Russian platform for a non-profit legal advisory foundation serving Russian nationals in Syria.",
    "tech": ["Laravel", "RTL", "Security", "Railway"],
    "website": "https://syru-legal.up.railway.app/ar",
    "image": "assets/secure_project_placeholder.jpg",
  },

  // ─────────────────────────────────────────────────────────────
  // 4. OboSyria — sole engineer, deployed, pre-launch
  // ─────────────────────────────────────────────────────────────
  {
    "tier": "production",
    "title": "OboSyria",
    "schemaType": "SoftwareApplication",
    "role": "Sole Engineer",
    "cardBadges": ["Full Stack", "Pre-Launch"],
    "badges": ["Full Stack", "Pre-Launch", "Sole Engineer"],
    "outcome":
        "Moderated classifieds platform for real estate and vehicle listings — every listing is reviewed and approved before publication.",
    "leadRole":
        "Sole engineer on the system: architecture, build, deployment, and day-to-day operations. Deployed and operating in pre-launch, with public release imminent.",
    "achievements": [
      "Sole engineer on the system: architecture, build, deployment, and day-to-day operations.",
      "Laravel REST API serving a React single-page application from the same origin, delivered as an installable PWA with a service worker.",
      "Editorial moderation pipeline in which every listing is reviewed and approved before publication, blocking fraudulent posts.",
      "Passwordless WhatsApp OTP login, administrator multi-factor authentication, and rate limiting at both the application and Nginx layers.",
      "Image upload and thumbnail generation on Cloudflare R2, with scheduled jobs pruning orphaned media.",
    ],
    "architecture":
        "Stack & Architecture: Laravel, React (Vite), PWA / Service Workers, Cloudflare R2, WhatsApp OTP (Wasender), Resend, VPS (Nginx).",
    "desc":
        "Moderated classifieds platform for real estate and vehicle listings — every listing is reviewed and approved before publication.",
    "tech": ["Laravel", "React", "PWA"],
    "website": "https://obosyria.com/",
    // PLACEHOLDER BRAND MARK. To swap in the real logo, overwrite
    // assets/obosyria_logo.png with the real file — nothing else needs to
    // change. It renders BoxFit.contain on a backdrop tinted from
    // `brandColor`, so: square-ish, transparent background, and readable
    // on both a dark and a light tint. Update `brandColor` too if the real
    // logo's palette differs from OboSyria's #0B4F6C theme colour.
    "image": "assets/obosyria_logo.png",
    "logo": true,
    "brandColor": 0xFF0B4F6C,
  },

  // ═════════════════════════════════════════════════════════════
  // OTHER PROJECTS — product, academic, and personal work
  // ═════════════════════════════════════════════════════════════

  // ─────────────────────────────────────────────────────────────
  // 5. Lumi Rewards — B2B loyalty product (Lumi Coin Syria)
  // ─────────────────────────────────────────────────────────────
  {
    "tier": "other",
    "title": "Lumi Rewards",
    "role": "Flutter Developer & Product Contributor",
    "badges": ["Product Work", "Mobile"],
    "outcome":
        "B2B loyalty product built in Flutter with GetX and Clean Architecture — vendor-facing menus, offers, and rewards, with CI/CD-gated releases.",
    "leadRole":
        "Flutter Developer and Product Contributor on Lumi Rewards — a B2B loyalty platform built for the Syrian market, contributing to product planning and feature prioritization alongside mobile delivery.",
    "achievements": [
      "Develop the Flutter app using GetX and Clean Architecture, contributing to product planning and feature prioritization.",
      "Build vendor-facing features for menus, offers, and rewards, plus a merchant partner directory.",
      "Configure CI/CD workflows for automated builds and release preparation.",
    ],
    "architecture":
        "Stack & Architecture: Flutter, Dart, GetX, Clean Architecture, REST integration, CI/CD.",
    "desc":
        "B2B loyalty product built in Flutter with GetX and Clean Architecture — vendor-facing menus, offers, and rewards, with CI/CD-gated releases.",
    "tech": ["Flutter", "GetX", "Clean Arch"],
    "behance": "https://www.behance.net/gallery/238527685/LUMI-REWARDS",
    "image": "assets/lumilogo.jpeg",
    "video": "https://youtube.com/shorts/boKRrkg6N58?feature=share",
  },

  // ─────────────────────────────────────────────────────────────
  // 6. UniVerse — graduation project (AI scheduler, RAG, tracking)
  // ─────────────────────────────────────────────────────────────
  {
    "tier": "other",
    "title": "UniVerse",
    "role": "Lead Flutter Developer",
    "badges": ["Graduation Project", "AI Integration"],
    "outcome":
        "Smart campus app with a RAG AI chatbot, an AI schedule generator, and live bus tracking on OpenStreetMap.",
    "leadRole":
        "Graduation project — a smart campus mobile application combining Clean Architecture, an AI scheduling system, a RAG chatbot, and real-time bus tracking.",
    "achievements": [
      "Hybrid AI system (n8n + Gemini) generating personalized academic schedules from GPA and prerequisite rules, with natural-language negotiation.",
      "RAG AI chatbot built with n8n and Gemini, answering student queries in real time from university data.",
      "Real-time university bus tracking over WebSockets with OpenStreetMap, streaming live driver locations to students.",
      "Clean Architecture boundaries across controllers, repositories, and use cases.",
    ],
    "architecture":
        "Stack & Architecture: Flutter, Dart, GetX, Clean Architecture, Socket.IO, Firebase FCM, n8n, Gemini, OpenStreetMap.",
    "desc":
        "Smart campus app with a RAG AI chatbot, an AI schedule generator, and live bus tracking on OpenStreetMap.",
    "tech": ["Flutter", "GetX", "n8n", "Gemini"],
    "behance": "https://www.behance.net/gallery/241792513/UniVerse",
    "image": "assets/universelogo.png",
    "video": "https://youtu.be/6jKZEwRWwDo",
  },

  // ─────────────────────────────────────────────────────────────
  // 7. Nibrass Hub — personal Flutter build with an assistant
  // ─────────────────────────────────────────────────────────────
  {
    "tier": "other",
    "title": "Nibrass Hub",
    "role": "Flutter Developer",
    "badges": ["Personal Project", "AI Integration"],
    "outcome":
        "Personal Clean Architecture Flutter build with an assistant that answers housing and transport questions.",
    "leadRole":
        "Personal project — an API-first Flutter application built around Clean Architecture and GetX, with an assistant layered on top for housing and transport questions. Not a production system and not in use by an institution.",
    "achievements": [
      "Built housing and transport workflows in Flutter with separated Presentation, Domain, and Data layers.",
      "Layered in an assistant on n8n + Gemini that answers housing and transport questions from the app's data.",
      "Handled authenticated mobile sessions with JWT flows, Dio interceptors, and clean request handling.",
    ],
    "architecture":
        "Stack & Architecture: Flutter, Dart, GetX, Clean Architecture, n8n, Gemini, JWT.",
    "desc":
        "Personal Clean Architecture Flutter build with an assistant that answers housing and transport questions.",
    "tech": ["Flutter", "GetX", "n8n", "Gemini"],
    "github": "https://github.com/khaderhash/nibrass",
    "image": "assets/nibrass.png",
    "video": "https://youtu.be/Rk9tBVoOixY",
  },

  // ─────────────────────────────────────────────────────────────
  // 8. Expen Scope (EXS)
  // ─────────────────────────────────────────────────────────────
  {
    "tier": "other",
    "title": "Expen Scope (EXS)",
    "role": "Lead Flutter Developer",
    "badges": ["Personal Project", "AI Integration"],
    "outcome":
        "Dual-personality finance assistant — one product serving business and individual flows, with AI-driven workflows.",
    "leadRole":
        "Lead Flutter Developer for a dual-personality financial assistant serving business and individual finance workflows with AI automation.",
    "achievements": [
      "Designed a flexible finance assistant with separate business and individual experiences under one product model.",
      "Delivered a full-stack build: Flutter frontend, Laravel backend, integration, and deployment pipeline.",
      "Enhanced financial workflows with n8n automation tied to the Google Gemini API.",
    ],
    "architecture":
        "Stack & Architecture: Flutter, Dart, Laravel, n8n, Gemini, REST APIs, CI/CD.",
    "desc":
        "Dual-personality finance assistant — one product serving business and individual flows, with AI-driven workflows.",
    "tech": ["Flutter", "n8n", "Laravel"],
    "behance":
        "https://www.behance.net/gallery/231325481/Exs-A-smart-financial",
    "image": "assets/exslogo.png",
    "video": "https://youtu.be/tZjbgxo0VO0",
  },

  // ─────────────────────────────────────────────────────────────
  // 9. SSSD Mobile App
  // ─────────────────────────────────────────────────────────────
  {
    "tier": "other",
    "title": "SSSD Mobile App",
    "role": "Flutter Developer",
    "badges": [],
    "outcome":
        "Mobile service-request and news platform for the Syrian Society for Social Development.",
    "leadRole":
        "Flutter Developer for a digital transformation app supporting NGO service requests, communication, and news delivery.",
    "achievements": [
      "Digitized NGO service access via mobile request submission flows wired to REST APIs.",
      "Centralized beneficiary communication through structured news and service updates inside the app.",
      "Organized features around clean mobile modules for clear separation of request and content flows.",
    ],
    "architecture":
        "Stack & Architecture: Flutter, Dart, REST APIs, service-request workflows, NGO operations.",
    "desc":
        "Mobile service-request and news platform for the Syrian Society for Social Development.",
    "tech": ["Flutter", "REST API", "NGO Tech"],
    "image": "assets/sssd.png",
  },

  // ─────────────────────────────────────────────────────────────
  // 10. Smart Telegram Bot
  // ─────────────────────────────────────────────────────────────
  {
    "tier": "other",
    "title": "Smart Telegram Bot",
    "role": "Automation Engineer",
    "badges": ["Automation"],
    "outcome":
        "n8n workflows that route Telegram support queries and log structured complaints to Google Sheets.",
    "leadRole":
        "Automation Engineer for a customer-support automation workflow that connects Telegram conversations with structured complaint logging.",
    "achievements": [
      "Automated support intake with instant Telegram query handling via n8n workflows on Telegram API events.",
      "Surfaced operational visibility through complaint and feedback records mapped into admin-ready Google Sheets logs.",
      "Built JSON-based routing and response flows for consistent customer communication.",
    ],
    "architecture":
        "Stack & Architecture: n8n, Telegram API, Google Sheets API, JSON, webhook automation.",
    "desc":
        "n8n workflows that route Telegram support queries and log structured complaints to Google Sheets.",
    "tech": ["n8n", "Telegram API", "Automation"],
    "image": "assets/bot.png",
  },

  // ─────────────────────────────────────────────────────────────
  // 11. WhatsApp Automation Bot
  // ─────────────────────────────────────────────────────────────
  {
    "tier": "other",
    "title": "WhatsApp Automation Bot",
    "role": "Automation Engineer",
    "badges": ["Automation"],
    "outcome":
        "Node.js automation handling repeatable customer responses and structured inquiry routing.",
    "leadRole":
        "Automation Engineer for a Node.js communication assistant focused on customer inquiries and repeatable response workflows.",
    "achievements": [
      "Accelerated inquiry handling with an automated Node.js WhatsApp service.",
      "Reduced repetitive manual communication via reusable conversation flows.",
      "Supported workflow consistency by separating automation rules from communication execution.",
    ],
    "architecture":
        "Stack & Architecture: Node.js, WhatsApp automation, workflow scripting, API-based messaging.",
    "desc":
        "Node.js automation handling repeatable customer responses and structured inquiry routing.",
    "tech": ["Node.js", "WhatsApp", "Automation"],
    "image": "assets/wh_bot.png",
  },
];

/// Live, deployed systems I build **and** operate. Rendered first and larger.
final List<Map<String, dynamic>> productionProjects =
    projectsData.where((p) => p['tier'] == 'production').toList();

/// Product, academic, and personal work. Rendered below, in smaller cards.
final List<Map<String, dynamic>> otherProjects =
    projectsData.where((p) => p['tier'] != 'production').toList();

// ═════════════════════════════════════════════════════════════════
// Site content — single source of truth.
//
// Both the Flutter widgets AND tool/generate_shell.dart read from
// here. That is deliberate: the pre-hydration HTML shell must say
// exactly what the rendered app says, or it becomes cloaking.
// `flutter test test/static_shell_test.dart` fails if the committed
// shell in web/index.html no longer matches what this data generates.
// ═════════════════════════════════════════════════════════════════

const String siteUrl = "https://www.khaderhash.me/";
const String fullName = "Khader Hassan Hwaijeh";
const String siteTagline =
    "Software Engineer · Full-Stack Developer · Mobile & Web Applications · Damascus, Syria";

const String bioParagraph =
    "Full-stack software engineer who ships products to production and keeps them "
    "running. I build, deploy and personally operate four production systems on "
    "self-managed VPS infrastructure: a university services platform officially "
    "adopted by Al Sham Private University's housing department, a marketplace I "
    "founded from scratch, a legal foundation's bilingual public site, and a "
    "classifieds platform in pre-launch. Day to day that means Flutter mobile "
    "development, Laravel REST backends, Linux and Nginx operations with monitoring "
    "and automated backups, and AI automation with n8n.";

/// `icon` maps to an IconData in education_section.dart.
const List<Map<String, String>> educationData = [
  {
    "title": "B.Sc. in Software Engineering",
    "place": "Yarmouk Private University",
    "date": "2020 — 2026",
    "icon": "school",
  },
  {
    "title": "Flutter Development Training Program",
    "place": "Focal X Agency",
    "date": "2023 — 2024",
    "icon": "code",
  },
  {
    "title": "Data Analysis Using Power BI",
    "place":
        "Bytes4Future, Syrian Computer Society, in partnership with the Aga Khan Foundation",
    "date": "August 2026",
    "icon": "insights",
  },
  {
    "title": "Training of Trainers (ToT)",
    "place": "Smart Vision International Academy (UK)",
    "date": "Completed",
    "icon": "award",
  },
];

const List<Map<String, Object>> skillGroups = [
  {
    "title": "Infrastructure & Security",
    "skills": [
      "Linux", "VPS Administration", "Nginx", "HTTPS/TLS",
      "CI/CD", "GitHub Actions", "Docker", "Cloudflare R2",
      "Uptime Monitoring", "Automated Backups",
    ],
  },
  {
    "title": "Backend & APIs",
    "skills": [
      "Laravel", "PHP", "REST API Design", "Node.js",
      "PostgreSQL", "MySQL", "JWT", "WebSockets",
    ],
  },
  {
    "title": "Mobile",
    "skills": [
      "Flutter", "Dart", "GetX", "Bloc", "Clean Architecture", "PWA",
    ],
  },
  {
    "title": "Frontend",
    "skills": [
      "React", "Vite", "Tailwind CSS", "JavaScript",
      "Service Workers", "Responsive & RTL (Arabic)",
    ],
  },
  {
    "title": "Product & Architecture",
    "skills": [
      "RBAC", "OTP Auth", "MFA", "Multi-role Systems",
      "Marketplace Architecture", "Rate Limiting", "Security Headers",
    ],
  },
  {
    "title": "AI & Automation",
    "skills": [
      "n8n", "Google Gemini", "RAG Chatbots",
      "Workflow Automation", "Telegram & WhatsApp Bots", "Power BI",
    ],
  },
];

const String contactEmail = "khaderhuijih@gmail.com";

// ── Social identity ──────────────────────────────────────────────
// Defined once here and referenced from the widgets, the generated
// shell, the generated JSON-LD, and llms.txt. Changing a URL means
// changing it in this file only.
const String githubUrl = "https://github.com/khaderhash";
const String linkedInUrl =
    "https://www.linkedin.com/in/khader-hwaijeh-a8bb3629a/";
const String whatsappUrl = "https://wa.me/963991199846";
const String telegramUrl = "https://t.me/khaderhash";
const String emailUrl = "mailto:$contactEmail";

/// Profile links rendered in the shell. Keep in step with SocialIconsRow.
const List<Map<String, String>> profileLinks = [
  {"label": "GitHub", "url": githubUrl},
  {"label": "LinkedIn", "url": linkedInUrl},
];
