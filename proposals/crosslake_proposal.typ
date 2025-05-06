#import "../templates/proposal_template.typ": * 

#let crosslake_proposal_data = (
summary: (
    number: 1,
    data: (
      title: "Executive Summary",
      client_need: "Crosslake seeks to enhance its critical due diligence process by leveraging custom AI ('atomic agents') for increased efficiency and deeper insights, specifically targeting the automation of technology stack analysis as an initial validation point.",
      proposed_value: (
          (type: "paragraph", text: "Turbo Labs proposes a strategic, three-phase approach delivering incremental value:"),
          (type: "list", items: (
              "Phase 1: An MVP Tech Stack Analysis agent providing immediate utility and validating the core AI.",
              "Phase 2: Integration with VDRs/GitHub and active monitoring for significant efficiency gains.",
              "Phase 3 (Post Go/No-Go): A proof-of-concept Agent Management Hub & Process Roadmap, creating a scalable foundation for future automation."
          )),
          (type: "paragraph", text: "This iterative plan manages risk while building a powerful, tailored AI ecosystem for Crosslake's due diligence.")
      ),
      impact_statement: (
        title: "Our Goal",
        text: "Reduce technology stack analysis time by 90% with 'atomic agents'."
      ),
      roi_analysis: (
        assumptions: (
          (label: "Premium consulting rate", value: "$350/hour"),
          (label: "Estimated profit margin", value: "30%"),
          (label: "Internal cost per hour", value: "$245/hour"),
          (label: "Tech stack analyses per year", value: "20"),
          (label: "Current time per analysis", value: "40 hours (5 days)"),
          (label: "Document monitoring engagements", value: "10"),
          (label: "Current monitoring time", value: "8 hours/week per engagement"),
          (label: "Reports generated per year", value: "20"),
          (label: "Current time per report", value: "12 hours (1.5 days)")
        ),
        current_economics: (
          (label: "Current Process", value: "", note: none, is_header: true),
          (label: "Time per analysis", value: "40 hours", note: "(5 days)"),
          (label: "Revenue per analysis", value: "$14,000", note: "(40 hours × $350)"),
          (label: "Cost per analysis", value: "$9,800", note: "(40 hours × $245)"),
          (label: "Profit per analysis", value: "$4,200", note: none),
          (label: "Annual analyses", value: "20", note: none),
          (label: "Current annual profit", value: "$84,000", note: "(20 analyses × $4,200)", is_total: true)
        ),
        enhanced_economics: (
          (label: "AI-Enhanced Process", value: "", note: none, is_header: true),
          (label: "Time per analysis", value: "6 hours", note: "(85% reduction)"),
          (label: "Revenue per analysis", value: "$14,000", note: "(maintained)"),
          (label: "Cost per analysis", value: "$1,470", note: "(6 hours × $245)"),
          (label: "Profit per analysis", value: "$12,530", note: "(183% increase per analysis)"),
          (label: "Annual analyses", value: "20", note: "(maintained)"),
          (label: "New annual profit", value: "$250,600", note: "(20 analyses × $12,530)", is_total: true),
          (label: "Direct profit increase", value: "$166,600", note: "($250,600 - $84,000)", is_highlight: true)
        ),
        capacity_impact: (
          time_saved: (
            (label: "Time Savings Breakdown", value: "", note: none, is_header: true),
            (label: "Tech stack analyses", value: "680 hours", note: "(20 analyses × 34 hours saved)"),
            (label: "Document monitoring", value: "374 hours", note: "(10 engagements × 7.2 hours/week × 52 weeks)"),
            (label: "Report generation", value: "180 hours", note: "(20 reports × 9 hours saved)"),
            (label: "Total time saved annually", value: "1,234 hours", note: "(154 consultant days)", is_total: true)
          ),
          revenue_impact: (
            (label: "Additional Revenue Potential", value: "", note: none, is_header: true),
            (label: "Billable utilization", value: "80%", note: "of freed time"),
            (label: "New billable hours", value: "987 hours", note: "(1,234 hours × 80%)"),
            (label: "Additional revenue", value: "$345,450", note: "(987 hours × $350)"),
            (label: "Additional profit", value: "$103,635", note: "(30% margin)", is_total: true)
          )
        ),
        total_impact: (
          (label: "Total Annual Impact", value: "", note: none, is_header: true),
          (label: "Direct profit increase", value: "$166,600", note: "from existing analyses"),
          (label: "Additional profit", value: "$103,635", note: "from freed capacity"),
          (label: "Total annual profit impact", value: "$270,235", note: none, is_total: true),
          (label: "ROI timeline", value: "9.6 months", note: "(based on $215,000-$280,000 investment)", is_highlight: true)
        ),
        intangible_benefits: (
          "Competitive differentiation through faster, more comprehensive analyses that identify risks and opportunities competitors might miss",
          "Enhanced talent experience by eliminating repetitive tasks, allowing your consultants to focus on high-value analysis and client interaction",
          "Scalable knowledge platform that captures institutional expertise and reduces dependency on individual consultants, creating a sustainable competitive advantage"
        ),
        intangible_benefits_intro: "As AI rapidly transforms the consulting industry, Crosslake has a unique opportunity to establish itself as a technology-enabled leader in due diligence services. By implementing this solution now, you position your firm ahead of the inevitable industry shift toward AI-augmented consulting.",
        custom_section: (
          title: "Tailoring the Automation to How Crosslake Does It",
          content: "While the market sees a rush toward generic AI solutions that attempt to commoditize due diligence, we recognize that Crosslake's success stems from its unique methodology and deep expertise. Your secret sauce—the systematic approach that has made you so successful—deserves better than an off-the-shelf solution. By developing custom agents that embody your specific processes and expertise, we're not just automating tasks; we're amplifying what makes Crosslake exceptional. This approach frees your team to focus on the strategic insights and analysis that truly differentiate your services, while ensuring the automated components maintain the high standards and unique perspective that your clients value. Unlike generic products that force you to adapt to their way of working, these custom agents will be built to enhance and scale your proven approach."
        )
      )
    )
  ),
needs: (
    number: 2,
    data: (
      title: "Understanding Your Needs",
      needs: (
        (
          id: "N1",
          title: "Automate High-Value DD Tasks",
          description: "Leverage custom AI ('atomic agents') to automate high-value, repetitive tasks within the due diligence workflow, starting with Tech Stack Analysis.",
          solution_approach: "Phased development of specific agents (Phase 1 MVP).",
          vision: "Targeted Task Automation"
        ),
        (
          id: "N2",
          title: "Validate AI Approach",
          description: "Validate the feasibility and efficacy of the custom agent approach via an initial pilot focusing on Technology Stack Analysis from VDR documents.",
          solution_approach: "Tech Stack Agent MVP (Phase 1).",
          vision: "Feasibility Proven Quickly"
        ),
        (
          id: "N3",
          title: "Increase Efficiency via Integration",
          description: "Increase efficiency by integrating automation directly with data sources like VDRs and code repositories, reducing manual data handling.",
          solution_approach: "VDR/GitHub Connectors (Phase 2).",
          vision: "Seamless Data Ingestion"
        ),
        (
          id: "N4",
          title: "Enable Active Monitoring",
          description: "Enable active monitoring of data sources for changes, automatically triggering analysis updates and notifications.",
          solution_approach: "'Active Watching' Capability (Phase 2).",
          vision: "Real-time Analysis Updates"
        ),
        (
          id: "N5",
          title: "Manage Agent Fleet",
          description: "Develop a long-term vision and capability for managing a 'fleet' of diverse agents used concurrently across multiple DD projects.",
          solution_approach: "Agent Management Hub PoC (Phase 3).",
          vision: "Scalable Agent Ecosystem"
        ),
        (
          id: "N6",
          title: "Visualize DD Process",
          description: "Create a visual representation of the overall DD process to better target and manage automation efforts.",
          solution_approach: "Process Mapping in Hub (Phase 3).",
          vision: "Strategic Automation Roadmap"
        ),
        (
          id: "N7",
          title: "Ensure Security & Scalability",
          description: "Ensure all solutions address the stringent security, privacy, and scalability requirements inherent to the due diligence process.",
          solution_approach: "Security-by-design, Cloud Architecture.",
          vision: "Enterprise-Grade Foundation"
        ),
        (
          id: "N8",
          title: "Iterative Value & Decision Point",
          description: "Utilize a phased approach delivering incremental value with clear deliverables and a key Go/No-Go decision point before major framework investment.",
          solution_approach: "Phased Delivery (Phase 1, 2, 3).",
          vision: "Risk-Managed Investment"
        )
      )
    )
  ),
  solution: (
    number: 3,
    data: ( 
      title: "Proposed Solution", 
      intro_content: (type: "paragraph", text: "We recommend the following phased approach, designed to deliver immediate value while building towards a comprehensive due diligence automation platform:"), 
      phases: ( 
        ( 
          number: 1, 
          title: "Tech Stack Analysis Agent - Manual Workflow MVP", 
          objective: "Deliver an immediately useful tool that reduces the time spent on technology stack analysis from days to hours, while validating our AI approach.", 
          image_path: "../proposals/images/crosslake_phase1.png",
          features: (
            "Document Upload: A secure, intuitive web interface that allows your team to quickly start tech stack analysis without complex setup or training. This means faster project kickoffs and more time for high-value analysis.",
            "Analysis Engine: Automatically identifies and analyzes technology choices from various documents, eliminating hours of manual document review and reducing the risk of missing critical technologies.",
            "Reporting: Generates consistent, professional PowerPoint reports that match your existing templates. This ensures reliable deliverables for clients while saving hours of manual report creation.",
            "Security: Bank-grade security with automatic document cleanup and audit trails, giving you and your clients peace of mind when handling sensitive information.",
            "AI Provider Support: Works with your preferred AI provider (Azure OpenAI, Anthropic, etc.), ensuring alignment with your compliance requirements and cost structure."
          ),
          deliverables: (
            "Production System: A fully functional web application that your team can start using immediately for tech stack analysis, delivering ROI from day one.",
            "Validation Report: Comprehensive analysis comparing AI-generated results with manual analysis, demonstrating accuracy and time savings.",
            "Security Documentation: Detailed security architecture and compliance documentation to satisfy your clients' IT security teams.",
            "Quick-Start Materials: User guides and training materials that get your team productive within hours, not days."
          )
        ), 
        ( 
          number: 2, 
          title: "Integrated & Active Workflow MCP", 
          objective: "Transform tech stack analysis from a point-in-time exercise to an automated, continuous process that identifies changes as they happen.", 
          image_path: "../proposals/images/crosslake_phase2.png",
          features: (
            "Document Source Integration: Monitors shared drives, SharePoint, or VDR platforms (via API when available) to automatically process new documents. This eliminates manual document gathering and ensures you're always working with the latest information.",
            "Code Analysis: Automatically detects and analyzes changes in GitHub repositories, alerting you to technology shifts that could impact deal value. This proactive approach helps identify risks and opportunities earlier.",
            "Change Detection: Focuses only on meaningful technology changes, reducing noise and helping your team prioritize what matters. This means less time sorting through updates and more time on strategic analysis.",
            "Report Updates: Keeps deliverables current with minimal effort, ensuring your recommendations always reflect the latest findings. This reduces revision cycles and improves client confidence.",
            "Dashboard: A unified view across all projects and analyses, helping you manage more deals without increasing headcount."
          ),
          deliverables: (
            "Enhanced Platform: The upgraded system with all integrations, ready to accelerate your existing workflow while maintaining security and reliability.",
            "Integration Package: Pre-built connectors for shared drives, SharePoint, and GitHub, with documentation for adding new data sources as needed.",
            "Monitoring System: Real-time tracking dashboard with customizable alerts, ensuring your team never misses critical technology changes.",
            "ROI Analysis: Detailed report showing time saved and additional insights gained through automation."
          )
        ), 
        ( 
          number: 3, 
          title: "Due Diligence Project Hub & Automation Roadmap", 
          objective: "Create a central platform for managing DD projects while mapping out which manual tasks are prime candidates for future automation.", 
          image_path: "../proposals/images/crosslake_phase3.png",
          features: (
            "Project Dashboard: Centralized view of all active DD projects, showing progress of each required task - from initial document collection through final report delivery. Helps teams track project status and identify bottlenecks in real-time.",
            "Task Management: Detailed tracking of both automated (Tech Stack Analysis) and manual DD tasks. Provides clear visibility into time spent on manual processes to identify automation opportunities.",
            "Agent Interface: Unified way to trigger and monitor automated tasks across your DD projects. Makes it easy for teams to leverage AI capabilities without changing their workflow.",
            "Effort Analytics: Tracks time spent on manual tasks across projects, building a data-driven case for which tasks should be automated next. This helps prioritize future automation investments.",
            "Automation Planning: Maps manual DD tasks against their automation potential, considering factors like time spent, complexity, and value to the analysis. Creates a clear roadmap for expanding automation."
          ),
          deliverables: (
            "DD Project Platform: Complete project management system tailored for due diligence workflows, integrating both manual and automated tasks in one interface.",
            "Task Analysis: Comprehensive assessment of current DD tasks, categorizing them by automation potential and expected ROI.",
            "Automation Roadmap: Prioritized plan for future automation efforts, backed by real project data and effort metrics.",
            "Integration Framework: Technical foundation for easily adding new AI agents as they're developed, ensuring the platform grows with your automation journey."
          )
        ) 
      )
    )
  ),
  tech: (
    number: 4,
    data: ( 
      title: "Technology Approach", 
      content: (
        (type: "paragraph", text: "Our solution leverages modern, proven technologies organized into three distinct layers:"),
        (
          type: "tech_table",
          groups: (
            (
              name: "AI & Machine Learning",
              description: "Foundation for document analysis, tech stack identification, and intelligent processing.",
              components: (
                (
                  name: "LangChain / LlamaIndex",
                  description: "Orchestrates AI workflows and document processing pipelines"
                ),
                (
                  name: "Hugging Face Transformers",
                  description: "Powers specialized NLP tasks and custom model fine-tuning"
                ),
                (
                  name: "spaCy NLP",
                  description: "Handles core natural language processing and entity extraction"
                ),
                (
                  name: "LLM Integration Layer",
                  description: "Flexible interface to Azure OpenAI, Anthropic, or other providers based on your requirements"
                )
              )
            ),
            (
              name: "Web Application",
              description: "Modern, responsive interface with real-time updates and seamless integrations.",
              components: (
                (
                  name: "React Frontend",
                  description: "Enterprise-grade user interface with modern component architecture"
                ),
                (
                  name: "FastAPI Backend",
                  description: "High-performance Python API server with automatic documentation"
                ),
                (
                  name: "PostgreSQL",
                  description: "Primary database for structured data and relationships"
                ),
                (
                  name: "Vector Database",
                  description: "Optional semantic search capabilities for enhanced document analysis"
                )
              )
            ),
            (
              name: "Infrastructure",
              description: "Enterprise-grade deployment with comprehensive security controls.",
              components: (
                (
                  name: "Docker Containers",
                  description: "Consistent deployment across development and production"
                ),
                (
                  name: "Kubernetes",
                  description: "Container orchestration for high availability and scaling"
                ),
                (
                  name: "Cloud Platform",
                  description: "Deployable to AWS, Azure, or GCP based on your preference"
                ),
                (
                  name: "Security Controls",
                  description: "SOC2-aligned security measures and audit capabilities"
                )
              )
            )
          )
        )
      )
    )
  ),
  security: (
    number: 5,
    data: ( 
      title: "Security & Privacy by Design", 
      content: ( 
        (type: "paragraph", text: "Recognizing the sensitivity of due diligence data, security is integrated throughout our process:"), 
        (type: "list", items: (
          text(weight: 500)[Secure Development:] + " Adherence to OWASP Top 10 and secure coding best practices.",
          text(weight: 500)[Data Handling:] + " Strict protocols for data encryption (at rest & in transit), access control, secure processing, and data lifecycle management (retention/deletion) aligned with Crosslake policies.",
          text(weight: 500)[LLM Integration:] + " Secure API usage, clear understanding of provider data policies, preference for providers offering business agreements (like Azure OpenAI or enterprise tiers), and exploration of data anonymization/masking techniques where feasible.",
          text(weight: 500)[Access Control:] + " Role-Based Access Control (RBAC) implementation, particularly in Phases 2 and 3.",
          text(weight: 500)[Infrastructure Security:] + " Secure cloud configuration, network isolation, regular vulnerability scanning.",
          text(weight: 500)[Compliance:] + " Commitment to working with Crosslake to meet relevant compliance standards (e.g., SOC2 considerations)."
        ))
      ) 
    )
  ),
  management: (
    number: 6,
    data: ( 
      title: "Project Management & Collaboration", 
      content: ( 
        (type: "paragraph", text: "Our project management approach is built on rapid iteration and continuous feedback, ensuring maximum value delivery:"), 
        (type: "list", items: (
          text(weight: 500)[Rapid Iteration Stream:] + " Daily or bi-daily updates provide a continuous stream of progress, allowing stakeholders to see and influence development in real-time rather than waiting for formal milestones.",
          text(weight: 500)[Quantitative Progress Tracking:] + " We break down work into measurable tasks with clear acceptance criteria, providing transparent progress metrics and ensuring timeline accuracy.",
          text(weight: 500)[Reserved Capacity:] + " We explicitly allocate capacity for feedback and iteration cycles, ensuring we can rapidly incorporate insights without compromising the timeline.",
          text(weight: 500)[Outcome-Based Measurement:] + " Success is measured against defined business outcomes rather than just technical deliverables, ensuring we're delivering real value.",
          text(weight: 500)[Collaborative Tools:] + " Shared project dashboards and communication channels provide real-time visibility into progress, decisions, and upcoming work.",
          text(weight: 500)[Flexible Adaptation:] + " Our process adapts to your feedback and changing needs while maintaining our rapid delivery pace."
        ))
      ) 
    )
  ),
  why_us: (
    number: 7,
    data: ( 
      title: "Why Turbo Labs?", 
      content: ( 
        (type: "paragraph", text: "Turbo Labs is uniquely positioned to partner with Crosslake on this initiative due to our focused expertise and collaborative approach:"), 
        (type: "list", items: (
          text(weight: 500)[Development Velocity:] + " Proven 7X improvement in development velocity through our agent-powered development workflow, validated across multiple client projects.",
          text(weight: 500)[AI & Agentic Systems Focus:] + " Deep experience in designing and building custom AI solutions, including NLP, LLM integration, and agentic workflows.",
          text(weight: 500)[Enterprise Application Development:] + " Proven ability to deliver secure, scalable, and reliable software for business-critical processes.",
          text(weight: 500)[Agile & Collaborative:] + " We work as an extension of your team, prioritizing communication and adapting to evolving needs.",
          text(weight: 500)[Technology Proficiency:] + " Expertise across the proposed technology stack.",
          text(weight: 500)[Understanding of Business Value:] + " We focus on delivering solutions that provide tangible efficiency gains and strategic advantages."
        )) 
      ) 
    )
  ),
  pricing: (
    number: 8,
    data: ( 
      title: "Investment Overview", 
      intro_text: (type: "paragraph", text: "We propose a Fixed Price per Phase model for budget predictability. Final pricing within the stated ranges will be confirmed following detailed scoping workshops for each phase."), 
      phase_costs: ( 
        (number: 1, title: "Manual Workflow MVP", min_price: "85,000", max_price: "110,000"), 
        (number: 2, title: "Integrated & Active Workflow MCP", min_price: "65,000", max_price: "85,000"), 
        (number: 3, title: "Agent Management Hub & Roadmap PoC", min_price: "75,000", max_price: "85,000")
      ), 
      assumptions_text: (type: "paragraph", text: "Pricing assumes: reasonable availability of Crosslake SMEs for requirements/feedback/UAT; necessary API access/credentials for integrations (Phase 2+); standard security/compliance requirements discussed; scope alignment during kickoff."), 
      exclusions: (
        "Ongoing cloud hosting infrastructure costs.", 
        "Ongoing third-party API costs (e.g., LLM usage, VDR API fees if applicable).", 
        "Data migration from legacy systems (if any).", 
        "Post-deployment application support & maintenance (available via separate agreement)."
      ) 
    )
  ),
  timeline: (
    number: 9,
    data: ( 
      title: "Estimated Timeline", 
      intro_text: (type: "paragraph", text: "The following provides a high-level estimate. Detailed project schedules with specific milestones will be developed collaboratively for each phase."), 
      phases: ( 
        (
          number: 1, 
          title: "Manual Workflow MVP", 
          duration: "4-6 Weeks",
          description_text: "Deliver an immediately useful tool that reduces the time spent on technology stack analysis from days to hours, while validating our AI approach.",
          approval_by: "Product Lead",
          target_date: "End of Week 6"
        ), 
        (
          number: 2, 
          title: "Integrated & Active Workflow MCP", 
          duration: "6-8 Weeks",
          description_text: "Transform tech stack analysis from a point-in-time exercise to an automated, continuous process that identifies changes as they happen.",
          approval_by: "Product Lead + Technical Lead",
          target_date: "End of Week 14"
        ), 
        (
          number: 3, 
          title: "Agent Management Hub & Roadmap PoC", 
          duration: "4-6 Weeks",
          description_text: "Create a central platform for managing DD projects while mapping out which manual tasks are prime candidates for future automation.",
          approval_by: "Product Lead",
          target_date: "End of Week 20"
        )
      )
    )
  ),
  next_steps: (
    number: 10,
    data: ( 
      title: "Next Steps", 
      content: (
        (type: "paragraph", text: "We are enthusiastic about partnering with Crosslake. We recommend the following next steps:"),
        (type: "list", items: (
          "Schedule a follow-up call to discuss this proposal and answer any questions.",
          "Conduct a collaborative scoping workshop (~2-4 hours) to finalize Phase 1 details (document types, specific tech stack entities, LLM choice, detailed acceptance criteria).",
          "Upon mutual agreement and SOW execution for Phase 1, commence project kickoff."
        )),
        (type: "paragraph", text: "We look forward to the opportunity to work together."),
        (
          type: "callout",
          title: "A Note on Timing and Partnership",
          content: "We're at a pivotal moment in technology. While the market is saturated with superficial 'AI solutions' and many businesses are experiencing fatigue from empty promises, we're actively seeking partners who recognize the deeper opportunity. As pioneers in this space, we see beyond the hype to the transformative potential of custom, industry-specific AI solutions. We're specifically looking to partner with organizations like Crosslake—companies with deep industry expertise, established manual processes, and the vision to transform them. Your domain knowledge in due diligence, combined with our AI expertise, creates an opportunity to build something truly revolutionary, not just another generic AI tool."
        ),
         (type: "paragraph", text: [#text(weight: "medium")[- and yes, this proposal was built with an agent.]]),
      )
    )
  )
)


#show: proposal(
  "Turbo Labs, Inc.",
  "2024 N Freedom Pl", "Fayetteville, AR",
  "Zac Brooks", "zac@turbo.inc", "501.733.2220", "../images/turbo-black.png",
  "Crosslake",
  "Dmitry Kordysh",
  "Managing Director",
  none,
  none,
  "Proposal",
  "AI-Enabled Due Diligence Agents & Framework",
  "Prototyping an entry point for Crosslake into revenue multiplication through AI.",
  datetime.today().display("[day] [month repr:long], [year]"),
  "May 2025",
  "This document contains confidential information proprietary to Turbo Labs, Inc. and the client. It is intended solely for the use of the individual or entity to whom it is addressed.",

  crosslake_proposal_data
)
