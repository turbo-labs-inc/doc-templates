#import "../templates/proposal_template_v2.typ": *

#let crosslake_proposal_data = (
  summary: (
    number: 1,
    data: (
      title: "Executive Summary",
      client_need: (
      "Achieve higher degree of automation of Crosslakes's Due Diligence execution and reduce the level of manual labor. Advance CL's posture as AI-enabled firm."
      ),
      proposed_value: (
        (type: "paragraph", text: "Our solution is an AI portal housing small, task-specific agents (grouped by Diligence track) to automate DD tasks like tech analysis and PPT drafting. Initially requiring human oversight, it uses SharePoint-synced VDR data, proprietary data, and LLMs, aiming for direct VDR access. The final platform includes agent management, attention to security/compliance, and enterprise-readiness features."),
        (type: "strong_paragraph", text: "Advantages vs. Third-Party Platform (Your Custom Solution)"),
        (type: "list", items: (
            text(weight: 500)[Tailored to Your Process:  #text(weight: "light")[Custom-built to fit Crosslake's specific DD methodology, unlike generic platforms]],    
            text(weight: 500)[IP Ownership & No Lock-In:  #text(weight: "light")[Crosslake owns the resulting IP; no ongoing vendor dependency after delivery.]],
            text(weight: 500)[Evolves with Your Business:  #text(weight: "light")[The platform can be continuously adapted and expanded to meet future needs.]]
        )),

        (type: "strong_paragraph", text: "Phased Approach Summary"),
        (type: "list", items: (
            text(weight: 500)[Phase 1: #text(weight: "light")[Build a proof-of-concept agent and define the production plan (including security/compliance) for Phase 2.]],
            text(weight: 500)[Phase 2: #text(weight: "light")[Deliver the production-ready MVP portal and initial agent set.]],
            text(weight: 500)[Phase 3: #text(weight: "light")[Continuously enhance the platform and deliver new agents within the established ecosystem.]]
        ))
      ),
    )
  ),
  needs: (
    number: 2,
    data: (
      title: "Core Objectives & Approach",
      needs: (
        (
          title: "Automate DD Execution",
          description: "Significantly reduce manual labor in the due diligence process through targeted AI agents deployed via a central portal.",
          vision: "Efficient, AI-Augmented DD",
          solution_approach: "Develop task-specific agents (Phase 1 POC, Phase 2+ MVP)."
        ),
        (
          title: "Advance AI Posture",
          description: "Position Crosslake as an AI-enabled firm by strategically integrating custom AI capabilities into core processes.",
          vision: "Strategic Technology Leadership",
          solution_approach: "Build an internal AI platform showcasing practical AI application."
        ),
        (
          title: "Flexible & Reliable Automation",
          description: "Implement an agentic approach for incremental value, focusing on reliable AI capabilities where they excel, while maintaining essential human oversight.",
          vision: "Pragmatic AI Implementation",
          solution_approach: "Phased rollout, focusing on high-value, reliable agents first."
        )
      )
    )
  ),
  solution: (
    number: 3,
    data: (
      title: "Proposed Solution & Phasing",
      intro_content: (type: "paragraph", text: "We propose the following phased approach to incrementally build and deploy the AI-enabled Due Diligence portal and agent fleet:"),
      phases: (
        (
          number: 1,
          title: "POC Agent & Platform Definition",
          objective: "Define requirements for one POC agent, deploy test data, build the agent to prove AI capability (not production ready), and define requirements/design for the underlying platform/portal. Provide cost estimates and plans for Phase 2.",
          goals: (
             "Validate core AI agent feasibility for a specific DD task.",
             "Define the foundational architecture for the agent portal.",
             "Establish clear requirements and roadmap for Phase 2 MVP."
          ),
          image_path: "../proposals/images/crosslake_phase1.png",
        ),
        (
          number: 2,
          title: "Production-Ready MVP",
          objective: "Conduct detailed design and build of a production-ready Minimum Viable Product (MVP) including several prioritized agents and the underlying management platform.",
          goals: (
            "Deploy a usable platform with initial agents for key DD tracks.",
            "Integrate with initial data sources (SharePoint sync).",
            "Ensure MVP is secure, compliant, and ready for pilot usage."
          ),
          image_path: "../proposals/images/crosslake_phase2.png",
        ),
        (
          number: 3,
          title: "Platform Enhancement & Agent Expansion",
          objective: "Implement ongoing improvements to the platform and build out new agents based on evolving priorities, potentially structured as rolling epics.",
          goals: (
            "Expand agent fleet based on prioritized DD automation opportunities.",
            "Enhance platform features (maintenance, monitoring, direct VDR access).",
            "Scale the solution to support multiple teams and diligences."
          ),
          image_path: "../proposals/images/crosslake_phase3.png",
        )
      )
    )
  ),
  why_us: (
    number: 4,
    data: (
      title: "Why Turbo Labs?",
      intro_content: (type: "paragraph", text: "Turbo Labs offers a unique combination of AI expertise, development velocity, and a collaborative partnership model:"),
      points: (
        (
          title: "Proven Velocity",
          description: "We build enterprise software 7X faster than competitors by utilizing our own proprietary agentic development workflow - we eat our own dogfood."
        ),
        (
          title: "AI & Agentic Systems Focus",
          description: "Deep expertise in custom AI solutions; we are positioned at the cutting edge and aim to share these advancements with partners like Crosslake."
        ),
        (
          title: "Enterprise Development & Success",
          description: "Delivered large-scale solutions for Fortune 100/500 clients and successfully brought award-winning products to market."
        ),
        (
          title: "Collaborative Partnership",
          description: "We work as an extension of your team, prioritizing communication, transparency, and adapting to evolving needs for a true partnership."
        ),
        (
          title: "Outcomes-Focused Approach",
          description: "We focus on tangible outcomes, correlating the experimental nature of cutting-edge AI work with delivering measurable business value."
        ),
        (
          title: "Technology Proficiency",
          description: "Expertise across the proposed technology stack (React, FastAPI, Python AI ecosystem, Cloud Platforms) ensures robust solutions."
        )
      )
    )
  ),
  pricing: (
    number: 5,
    data: (
      title: "Investment Overview",
      intro_text: (type: "paragraph", text: "We propose a Fixed Price per Phase model for budget predictability. Final pricing within the stated ranges will be confirmed following detailed scoping workshops for each phase."),
      phase_costs: (
        (number: 1, title: "POC Agent & Platform Definition", min_price: "45,000", max_price: "60,000"),
        (number: 2, title: "Production-Ready MVP", min_price: "85,000", max_price: "110,000"),
        (number: 3, title: "Platform Enhancement & Agent Expansion", min_price: "TBD", max_price: "TBD")
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
    number: 6,
    data: (
      title: "Estimated Timeline Overview",
      intro_text: (type: "paragraph", text: "The following provides a high-level estimate. Detailed schedules will be developed collaboratively for each phase."),
      phases: (
        (
          number: 1,
          title: "POC Agent & Platform Definition",
          objective: "Define requirements for one POC agent, build the agent to prove AI capability, define platform requirements/design, plan Phase 2.",
          duration: 6,
          duration_text: "4-6 Weeks"
        ),
        (
          number: 2,
          title: "Production-Ready MVP",
          objective: "Detailed design and build of a production-ready MVP including several prioritized agents and the management platform.",
          duration: 8,
          duration_text: "6-8 Weeks"
        ),
        (
          number: 3,
          title: "Platform Enhancement & Agent Expansion",
          objective: "Implement ongoing platform improvements and build new agents based on priorities.",
          duration: 0,
          duration_text: "Ongoing (Rolling Epics)"
        )
      )
    )
  ),
  next_steps: (
    number: 7,
    data: (
      title: "Next Steps",
      content: (
        (type: "paragraph", text: "We are enthusiastic about partnering with Crosslake on this strategic initiative. We recommend the following next steps:"),
        (type: "list", items: (
          "Schedule a follow-up call to discuss this revised proposal and answer questions.",
          "Conduct collaborative scoping workshop(s) to detail Phase 1 requirements (POC agent scope, platform definition, success criteria).",
          "Upon mutual agreement and SOW execution for Phase 1, commence project kickoff."
        )),
        (type: "paragraph", text: "We look forward to the opportunity to accelerate Crosslake's AI capabilities."),
        (type: "callout",
          title: "A Note on Timing and Partnership",
          content: "We're at a pivotal moment in technology. While the market is saturated with superficial 'AI solutions' and many businesses are experiencing fatigue from empty promises, we're actively seeking partners who recognize the deeper opportunity. As pioneers in this space, we see beyond the hype to the transformative potential of custom, industry-specific AI solutions. We're specifically looking to partner with organizations like Crosslake—companies with deep industry expertise, established manual processes, and the vision to transform them. Your domain knowledge in due diligence, combined with our AI expertise, creates an opportunity to build something truly revolutionary, not just another generic AI tool."
        ),
        (type: "paragraph", text: [#text(weight: "medium")[- and yes, this proposal was built with an agent.]])
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
  "AI-Enabled Due Diligence Agent Platform",
  "Building a flexible, scalable AI foundation for Crosslake's Due Diligence process.",
  datetime.today().display("[day] [month repr:long], [year]"),
  "TBD",
  "This document contains confidential information proprietary to Turbo Labs, Inc. and the client. It is intended solely for the use of the individual or entity to whom it is addressed.",
  crosslake_proposal_data
)
