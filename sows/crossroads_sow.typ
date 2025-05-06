// Import the revised template
#import "sow_template.typ": *

// Define all SOW content in a structured dictionary
#let crossroads_data = (
  overview: (
    number: 1,
    purpose: [Develop a comprehensive product strategy and technical roadmap for Crossroads, a centralized data integration platform that will serve as a hub for Gravitate's product ecosystem, enabling seamless data flow between systems and creating a single source of truth for key data entities.],
    outcomes: (
      [Define the Crossroads product vision, scope, and value proposition],
      [Validate the market opportunity and business case for the platform],
      [Establish a clear technical architecture and implementation roadmap],
      [Develop 3-5 stepping stones for market entry and product development],
      [Create visualization designs to communicate the product concept],
      [Deliver a comprehensive product strategy ready for implementation],
    )
  ),
  timeline: (
    number: 2,
    dates: ("5/1", "5/8", "5/15", "5/22", "5/29", "6/5"),
    milestones: (
      (
        number: "1",
        title: "Wrap Up Initial Designs + Reqs",
        schedule: ("1", "2", "", "", "", ""),
        description_text: [Complete initial research, stakeholder interviews, and product concept development. Deliver research findings and initial product concept brief.],
        approval_by: "Product Owner",
        target_date: "May 10, 2025"
      ),
      (
        number: "2",
        title: "Module Prototype",
        schedule: ("", "", "1", "1", "1", "2"),
        description_text: [Deliver market opportunity analysis and technical architecture approach. Present stepping stone concepts and integration requirements.],
        approval_by: "Product Owner + Technical Lead",
        target_date: "May 20, 2025"
      ),
      (
        number: "3",
        title: "Shippable Module",
        schedule: ("", "", "", "", "1", "2"),
        description_text: [Complete design visualizations, technical roadmap, and implementation plan. Deliver final strategy document and presentation materials.],
        approval_by: "Executive Sponsor",
        target_date: "June 5, 2025"
      )
    )
  ),
  scope: (
    number: 3,
    in_scope_summary: [The list below is a comprehensive list of the module. We expect things to evolve in the accelerated project, but our limit of scope is in design and frontend code delivered, primarily.],
    out_of_scope_summary: [
      + Features not in this list below
      + Section included to denote what is 'pending refinement' that might impact scope. As those items are polished - they will follow the change request process
      + Assumptions are Gravitate takes the heavy lifting with the transaction engine and background process - we will be delivering UI + API linkage only
    ],
    modules: ((
        module_number: "1",
        title: "RATEBOOK",
        description: "System for managing both customer billing rates and carrier cost rates.",
        sections: (
          (
            section_number: "1.1",
            title: "Ratebooks",
            description: "Customers can configure invoice/cost configurations for both carriers and customers.",
            requirements: (
              (
                id: "1.1.1",
                type: "Data View",
                feature: "Default Transporter Indicator",
                description: "Highlights and pins the default carrier row in the grid, providing clear visibility of primary transport provider"
              ),
              (
                id: "1.1.2",
                type: "Data View",
                feature: "Ratebook Reports (Customer + Carrier)",
                description: "Grid interface for managing customer-specific billing rates and rules. Carriers report will be mirror interface of customer ratebook with identical features, filtered to carrier counterparties for cost configuration"
              ),
              (
                id: "1.1.3",
                type: "Action/Workflow",
                feature: "Create a Ratebook",
                description: "Users will be able to create a ratebook by selecting an existing counterparty that doesn't have one, and fill out the configuration"
              ),
              (
                id: "1.1.4",
                type: "Action/Workflow",
                feature: "Invoice Configuration Tab",
                description: "Defines billing rules such as frequency, grouping methods, and invoice generation criteria. If the invoice status is active - users should get a warning when changing. Should be editable always, with a cancel save that is revealed upon changes"
              ),
              (
                id: "1.1.5",
                type: "Action/Workflow",
                feature: "Base Freight Tab",
                description: "Configuration of mileage-based rate tables that determine base freight charges per gallon or truck"
              ),
              (
                id: "1.1.6",
                type: "Action/Workflow",
                feature: "Accessorials Tab",
                description: "Rule engine for setting up conditional accessorial charges based on various triggers and criteria"
              ),
              (
                id: "1.1.7",
                type: "Action/Workflow",
                feature: "Surcharge Tab",
                description: "Configuration tool for percentage or per-mile fuel surcharges with conditional criteria"
              ),
              (
                id: "1.1.8",
                type: "Action/Workflow",
                feature: "Point-to-Point Tab",
                description: "Management of specific origin-destination pair rate overrides that supersede standard calculations"
              ),
              (
                id: "1.1.9",
                type: "Action/Workflow",
                feature: "Schedule New Rates",
                description: "Interface for scheduling future rate changes with effective dates, allowing proactive rate management"
              ),
              (
                id: "1.1.10",
                type: "Action/Workflow",
                feature: "Active Rate Management",
                description: "Tools for end-dating active rates with impact analysis showing affected orders and resulting recalculations"
              ),
              (
                id: "1.1.11",
                type: "Action/Workflow",
                feature: "Creating Rates in the UI",
                description: "Being able to create rates in the UI - across point to point, surcharge, accessorials, and base freight. User should be blocked from creating duplicate reference declarations (such as same market + PG)"
              )
            )
        ),
        )
      ),
      (
        module_number: "2",
        title: "LAUNCHPAD",
        description: "Users and their team get a home base to see what needs attention, is blocked, and general throughput + customer/freight metrics.",
        sections: (
          (
            section_number: "2.1",
            title: "Invoice Launchpad",
            description: "Central interface for managing and monitoring invoice status and metrics.",
            requirements: (
              (
                id: "2.1.1",
                type: "Data View",
                feature: "Revenue Throughput Chart",
                description: "Visual representation of monthly invoiced revenue, segmented by open and sent status to track billing progress"
              ),
              (
                id: "2.1.2",
                type: "Data View",
                feature: "Invoice Status Statistics",
                description: "Summary cards displaying Sent and Open totals with both invoice counts and monetary values for quick status assessment"
              ),
              (
                id: "2.1.3",
                type: "Data View",
                feature: "Revenue Type Breakdown",
                description: "Statistical cards showing total revenue segmented by base freight, accessorials, and surcharge categories"
              ),
              (
                id: "2.1.4",
                type: "Data View",
                feature: "Customer Summary Grid",
                description: "Interactive 30-day view of customer invoicing status with drill-down capabilities to expose attention items and time-to-invoice metrics"
              ),
              (
                id: "2.1.5",
                type: "Filter UX",
                feature: "Blocked Invoice Monitor",
                description: "Trending view of blocked invoices with quick-filter access and historical month trend analysis"
              ),
              (
                id: "2.1.6",
                type: "Filter UX",
                feature: "Credit/Rebill Monitor",
                description: "Summary and trend analysis of pending credit/rebill approvals with quick-access filtering"
              ),
              (
                id: "2.1.7",
                type: "Filter UX",
                feature: "Attention Items Summary",
                description: "Breakdown of items needing attention, categorized by base freight calculation errors and pending accessorial approvals"
              ),
              (
                id: "2.1.8",
                type: "Data View",
                feature: "Activity Feed",
                description: "Real-time feed of key status changes, approval activities, and comments related to blocked invoices and credit/rebills"
              )
            )
        ),
      )
    ))
  ),
  deliverables: (
    number: 4,
    deliverables: (
      (
        title: "Prototype Figma Designs",
        milestone: "MILESTONE #1",
        description: "A clickable prototype displaying all features in the module. This will include all of the features listed above having a visual reference to align on.",
        acceptance: "Approved by product lead.\n\nKey acceptance criteria is signoff per item in the list above.\n\nEach design's level of fidelity will be dependent on a joint decision if the item is blocking development or would be costly to rework."
      ),
      (
        title: "Module Prototype Frontend Code",
        milestone: "MILESTONE #2",
        description: "A functional prototype in Supply & Dispatch - hitting Airtable for data.",
        acceptance: "Approved by product lead and backend lead."
      ),
      (
        title: "Airtable DB",
        milestone: "MILESTONE #2",
        description: "Sample DB with scenario data seeded in. Excalibrr updated for compatibility with Ant Design v5, including visual tweaks for design consistency.",
        acceptance: "Approved by lead developers. Code review feedback must be provided within 3 business days within reason.\n\nGravitate team members will be able to use the storybook to visually inspect component functionality and work alongside the Turbo Labs team to validate completeness"
      ),
      (
        title: "Airtable AI Agent",
        milestone: "MILESTONE #2",
        description: "Simple internal chat app that can interface with the airtable and modify data. A chat based LLM agent that makes seeding in data for scenarios easier.",
        acceptance: "Extra item - necessary to increase speed but not deliver - approval will be usage enablement."
      ),
      (
        title: "Shippable Module",
        milestone: "MILESTONE #3",
        description: "We will deliver the prototype to hit the API - supporting all the way from customer configuration to invoice sending.",
        acceptance: "Approved by product + QA. Feature signoff happens throughout the effort.\n\nTesting will have a 1 month feedback period for scope changes as things become real, billed separately."
      ),
    )
  ),
  pricing: (
    number: 5,
    resources_needed: (
      [Due to the accelerated timeline of this effort, and the goal of shippable code - strong resources are needed on both sides to keep things going.],
      [Gravitate will provide BE support and review - and will build the EP's required for the shippable prototype.],
      [Capacity needed for backend will become necessary to keep timeline in the middle of the project, less so in the beginning.]
    ),
    // client_name will be passed from main sow() args
    turbo_resources: (
      (role: "PROJECT LEAD", individual: "ZAC BROOKS"),
      (role: "DESIGNER", individual: "VYTAS BU"),
      (role: "FE LEAD", individual: "ZEKE ZUMBRO"),
      (role: "JUNIOR FE ENGINEER", individual: "NICK BROOKS")
    ),
    client_resources: (
      (role: "PROJECT SPONSOR", individual: "MIKE SCHARF"),
      (role: "PRODUCT LEAD", individual: "TBD"),
      (role: "BE LEAD", individual: "NATHAN TURNER")
    ),
    milestone_costs: (
      (milestone: "Figma Prototypes", amount: 9313.22, is_total: false),
      (milestone: "App Prototypes", amount: 58286.67, is_total: false),
      (milestone: "Shippable Module", amount: 8222.43, is_total: false),
      (milestone: "TOTAL", amount: 78822.33, is_total: true)
    ),
    bonus_percent: 15 // Assuming bonus_percent should be passed here
  ),
  assumptions: (
    number: 6,
    assumptions: (
      (
        category: "Team Capacity",
        items: (
          "Backend team availability during prototype phase",
          "API's cannot be a blocker in the Ship phase",
          "Product team bandwidth for continuous feedback",
          "Technical lead participation in weekly architecture discussions",
          "QA team involvement for acceptance criteria"
        )
      ),
      (
        category: "Development Process",
        items: (
          "Regular sync meetings between teams",
          "Flexible review cycles for rapid iteration",
          "Documentation collaboration",
          "Clear communication channels"
        )
      )
    ),
    dependencies: (
      (
        category: "Knowledge Transfer",
        items: (
          "Backend team participation in design sessions",
          "Product team documentation of edge cases",
          "QA team definition of test scenarios"
        )
      ),
    )
  ),
  change_management: (
    number: 7,
    contact_name: "Bernard Webhe"
  ),
  announcements: (
    number: 8
  ),
  approval: (
    number: 9
    // client_name will be passed from main sow() args
  )
)


// Use the template, passing the structured data
#show: sow(
  title: "Statement of Work",
  subtitle: "Crossroads Data Integration Platform (SOW #1)",
  client: "Gravitate Energy, LLC",
  client_short_name: "Gravitate", // Added based on usage in template header
  provider: "turbo labs, inc.",
  project_start: "May 1, 2025",
  project_end: "June 5, 2025",
  created_date: "April 18, 2025",
  confidentiality_text: "This document and supporting materials contain confidential and proprietary business information. These materials may be printed or photocopied for use in evaluating the proposed project, but are not to be shared with other parties.",

  // Pass the consolidated data structure
  sow_content: crossroads_data

  // No body/doc parameter needed here anymore
)
