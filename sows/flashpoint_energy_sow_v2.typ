#import "../templates/sow_template.typ": *

// Define all SOW content for Flashpoint Energy V2 Implementation
#let flashpoint_energy_data = (
  overview: (
    number: 1,
    purpose: [Implement and integrate missing features from V1 into the current V2 version of the Flashpoint Energy application. This project will recreate critical functionality from V1 in the new V2 architecture, ensuring a complete and feature-rich application that maintains the full capabilities users expect while leveraging the improved architecture of V2.],
    outcomes: (
      [Seamless global site context integration that allows users to switch sites and filter data accordingly],
      [Comprehensive single railcar view with details, history timeline, BOLs, and comments system],
      [Complete pre-unload and pre-release railcar inspection workflows with signature capture],
      [Multi-step load creation wizard with progressive save, validation, and preview],
      [Detailed single load view with BOL download, email options, and split ticket management],
      [Robust system settings area for managing sites, customers, drivers, and synchronization],
      [Storage measurement and management tools for tank monitoring and historical data],
      [Advanced reporting modules for shrink analysis, run rates, and inventory],
      [Enhanced user management, authentication flows, and documentation access]
    )
  ),
  timeline: (
    number: 2,
    dates: ("5/12", "5/19", "5/26", "6/2", "6/9", "6/16"),
    milestones: (
      (
        number: "1",
        title: "Core Functionality & Single Railcar View",
        schedule: ("1", "2", "", "", "", ""),
        description_text: [
          *Site Selection Context:* Implementation of global context provider and hook for site selection, allowing users to switch sites via dropdown and filter data accordingly across the application.
          
          *Single Railcar View:* Creation of dedicated page for comprehensive railcar details, history timeline, associated BOLs, and comments system.
        ],
        approval_by: "David Settle",
        target_date: "May 19, 2025"
      ),
      (
        number: "2",
        title: "Railcar Workflows",
        schedule: ("", "1", "2", "", "", ""),
        description_text: [
          *Pre-Unload Workflow:* Dedicated form with mobile-friendly layout for pre-unload inspection checklist, including multi-field inputs, signature capture, and data persistence.
          
          *Pre-Release Workflow:* Similar dedicated form for pre-release inspections with checklist, signature capture, and mobile optimization.
        ],
        approval_by: "David Settle",
        target_date: "May 26, 2025"
      ),
      (
        number: "3",
        title: "Load Management Features",
        schedule: ("", "", "1", "2", "", ""),
        description_text: [
          *Load Creation Wizard:* Multi-step wizard guiding users through site, customer, driver, and fuel details with progressive save, validation, and BOL preview capabilities.
          
          *Single Load View:* Detailed page showing load information with BOL download/email options and split ticket management.
          
          *Load Amendment:* Functionality to modify certain fields on completed loads.
        ],
        approval_by: "David Settle",
        target_date: "June 2, 2025"
      ),
      (
        number: "4",
        title: "System Settings & Management",
        schedule: ("", "", "", "1", "2", ""),
        description_text: [
          *System Settings:* Comprehensive admin area for managing sites, customers, drivers, sync operations, and storage configuration.
          
          *Storage Management:* Tools for recording and reviewing storage tank measurements, linked to sites and storage groups.
          
          *User Management & Auth:* Complete user administration, self-service, and authentication flow pages.
        ],
        approval_by: "David Settle",
        target_date: "June 9, 2025"
      ),
      (
        number: "5",
        title: "Reporting & Documentation",
        schedule: ("", "", "", "", "1", "2"),
        description_text: [
          *Advanced Reporting:* Implementation of dedicated reporting modules with filtering, data visualization, and export capabilities including shrink analysis, run rate reports, and inventory volume/shrink reporting.
          
          *Documentation Page:* Page displaying SOP documents with descriptions and download buttons.
          
          *Help Page:* Support page with embedded tutorial videos in expandable sections.
        ],
        approval_by: "David Settle",
        target_date: "June 16, 2025"
      )
    )
  ),
  scope: (
    number: 3,
    in_scope_summary: [The features below are organized into logical modules based on functionality. Each feature represents specific capabilities from the V1 application that will be implemented in the V2 architecture, maintaining functional parity while leveraging the improved V2 framework.],
    out_of_scope_summary: [
      #list(
        [Development of new features not present in the original V1 application],
        [Major architectural refactoring beyond what is necessary for V2 compatibility],
        [Development or modification of backend APIs],
        [Server-side infrastructure setup or management],
        [Creation of extensive end-to-end automated test suites beyond basic functional testing],
        [App store submission or management]
      )
    ],
  modules: ( // Start of the main modules array
  ( // Start Module 1
    module_number: "1",
    title: "Core Functionality",
    description: "Essential features that provide global context and filtering capabilities across the application.",
    sections: ( // Start sections array for Module 1
      ( // Start Section 1.1
        section_number: "1.1",
        title: "Site Selection Context",
        description: "Global context provider for site management throughout the application.",
        requirements: ( // Start requirements array for Section 1.1
          (id: "1.1.1", feature: "Context Provider", description: "A global context provider and hook that manages the currently selected site throughout the V2 application. This allows users to switch sites via a dropdown and filters data views accordingly.", type: "Feature"), // Comma BETWEEN reqs
          (id: "1.1.2", feature: "Data Filtering", description: "Implicit feature - data fetching hooks and components throughout V1 used this context to filter data based on the selected site. Reusable dropdown component allowing users to change the active site.", type: "Feature"), // TRAILING Comma after last req
        ), // End requirements array for Section 1.1
      ), // TRAILING Comma after last section (Section 1.1)
    ), // End sections array for Module 1
  ), // << Comma BETWEEN Module 1 and Module 2

  ( // Start Module 2
    module_number: "2",
    title: "Single Railcar View",
    description: "Dedicated page providing comprehensive railcar information and management capabilities.",
    sections: ( // Start sections array for Module 2
      ( // Start Section 2.1
        section_number: "2.1",
        title: "Railcar View Components",
        description: "The key components and features of the railcar detail page.",
        requirements: ( // Start requirements array for Section 2.1
          (id: "2.1.1", feature: "Railcar Details Display", description: "Component showing core railcar attributes.", type: "Feature"), // Comma
          (id: "2.1.2", feature: "Associated BOLs Display", description: "Component listing related Bill of Ladings.", type: "Feature"), // Comma
          (id: "2.1.3", feature: "Railcar History Timeline", description: "Chronological display of all state changes, events, and actions taken on the railcar.", type: "Feature"), // Comma
          (id: "2.1.4", feature: "Comments System", description: "Section to view, add, and potentially edit timestamped comments associated with the railcar, including user attribution.", type: "Feature"), // Comma
          (id: "2.1.5", feature: "Dedicated URL", description: "Unique URL for each railcar, allowing direct navigation and sharing.", type: "Feature"), // TRAILING Comma
        ), // End requirements array for Section 2.1
      ), // TRAILING Comma after last section (Section 2.1)
    ), // End sections array for Module 2
  ), // << Comma BETWEEN Module 2 and Module 3

  ( // Start Module 3
    module_number: "3",
    title: "Railcar Workflows",
    description: "Mobile-optimized forms for railcar inspection processes.",
    sections: ( // Start sections array for Module 3
      ( // Start Section 3.1
        section_number: "3.1",
        title: "Pre-Unload Workflow",
        description: "Guided checklist for pre-unload inspection with signature capture.",
        requirements: ( // Start requirements array for Section 3.1
          (id: "3.1.1", feature: "Multi-Field Checklist", description: "Specific inputs for checks like load limit, product, DOT number, seal number match, brake set, wheel chocks, tank tests, grounding, valve checks etc. (using Toggles, Text, Number, Date inputs).", type: "Feature"), // Comma
          (id: "3.1.2", feature: "Signature Capture", description: "Required digital signature input using a canvas component.", type: "Feature"), // Comma
          (id: "3.1.3", feature: "Data Persistence", description: "Saving checklist answers and the captured signature associated with the railcar event.", type: "Feature"), // Comma
          (id: "3.1.4", feature: "Mobile-Friendly Layout", description: "Form designed with a constrained width suitable for mobile/tablet use.", type: "Feature"), // TRAILING Comma
        ), // End requirements array for Section 3.1
      ), // << Comma BETWEEN Section 3.1 and Section 3.2
      ( // Start Section 3.2
        section_number: "3.2",
        title: "Pre-Release Workflow",
        description: "Guided checklist for pre-release inspection with signature capture.",
        requirements: ( // Start requirements array for Section 3.2
          (id: "3.2.1", feature: "Multi-Field Checklist", description: "Specific inputs for checks like plug status, valve closures, placards, stenciling, seal application, temperature, remarks etc.", type: "Feature"), // Comma
          (id: "3.2.2", feature: "Signature Capture", description: "Required digital signature input using a canvas.", type: "Feature"), // Comma
          (id: "3.2.3", feature: "Data Persistence", description: "Saving checklist answers and signature.", type: "Feature"), // Comma
          (id: "3.2.4", feature: "Mobile-Friendly Layout", description: "Form designed with a constrained width.", type: "Feature"), // TRAILING Comma
        ), // End requirements array for Section 3.2
      ), // TRAILING Comma after last section (Section 3.2)
    ), // End sections array for Module 3
  ), // << Comma BETWEEN Module 3 and Module 4

  ( // Start Module 4
    module_number: "4",
    title: "Load Management",
    description: "Features for creating, viewing, and managing load records.",
    sections: ( // Start sections array for Module 4
      ( // Start Section 4.1
        section_number: "4.1",
        title: "Load Creation Wizard",
        description: "Multi-step process for creating new loads with validation and preview.",
        requirements: ( // Start requirements array for Section 4.1
          (id: "4.1.1", feature: "Multi-Step Process", description: "Guided flow with distinct steps for Site, Customer, Driver, Fuel, and Review.", type: "Feature"), // Comma
          (id: "4.1.2", feature: "Progressive Save", description: "Data saved incrementally at each step.", type: "Feature"), // Comma
          (id: "4.1.3", feature: "Data Validation", description: "Indication of errors/missing required fields before completion.", type: "Feature"), // Comma
          (id: "4.1.4", feature: "Autocomplete/Dropdowns", description: "Utilized options for selecting sites, customers, drivers, railcars.", type: "Feature"), // Comma
          (id: "4.1.5", feature: "PDF Preview", description: "Ability to download a preview BOL PDF before final submission.", type: "Feature"), // Comma
          (id: "4.1.6", feature: "Completion Action", description: "Final step to mark the load as complete and potentially trigger notifications.", type: "Feature"), // TRAILING Comma
        ), // End requirements array for Section 4.1
      ), // << Comma BETWEEN Section 4.1 and Section 4.2
      ( // Start Section 4.2
        section_number: "4.2",
        title: "Single Load View",
        description: "Detailed display of load information with download and management options.",
        requirements: ( // Start requirements array for Section 4.2
          (id: "4.2.1", feature: "Detailed Sections", description: "Organized display of BOL #, Customer, Loaded By, Volume, Date/Time, Terminal Info.", type: "Feature"), // Comma
          (id: "4.2.2", feature: "BOL Download", description: "Direct link/button to download the generated BOL PDF.", type: "Feature"), // Comma
          (id: "4.2.3", feature: "BOL Email", description: "Functionality to email the BOL, which is missing in V2.", type: "Feature"), // Comma
          (id: "4.2.4", feature: "Split Ticket Management", description: "Ability to view split weights and (for Admins) create or delete split tickets associated with the load.", type: "Feature"), // Comma
          (id: "4.2.5", feature: "Void Status Indicator", description: "Clearly indicates if a BOL has been voided.", type: "Feature"), // Comma
          (id: "4.2.6", feature: "Dedicated URL", description: "Unique URL for each completed load.", type: "Feature"), // TRAILING Comma
        ), // End requirements array for Section 4.2
      ), // << Comma BETWEEN Section 4.2 and Section 4.3
      ( // Start Section 4.3
        section_number: "4.3",
        title: "Load Amendment",
        description: "Functionality to modify fields on completed loads.",
        requirements: ( // Start requirements array for Section 4.3
          (id: "4.3.1", feature: "Field Modification", description: "Allows changing Customer, PO Number, Driver, and Truck fields post-completion. Visual indication of which fields have been modified from the original. Saves the amended data, likely creating a new version.", type: "Feature"), // TRAILING Comma
        ), // End requirements array for Section 4.3
      ), // TRAILING Comma after last section (Section 4.3)
    ), // End sections array for Module 4
  ), // << Comma BETWEEN Module 4 and Module 5

  ( // Start Module 5
    module_number: "5",
    title: "System Administration",
    description: "Administrative features for managing application data and settings.",
    sections: ( // Start sections array for Module 5
      ( // Start Section 5.1
        section_number: "5.1",
        title: "System Settings",
        description: "Management interfaces for core application data.",
        requirements: ( // Start requirements array for Section 5.1
          (id: "5.1.1", feature: "Site Management", description: "Table view with inline editing for site details (name, address, timezone) and visibility toggle.", type: "Feature"), // Comma
          (id: "5.1.2", feature: "Customer Management", description: "Table view with inline editing for customer details (code, name, site, address, email, contract) and visibility toggle.", type: "Feature"), // Comma
          (id: "5.1.3", feature: "Driver Management", description: "Table view with inline editing for driver details (code, name, site, carrier, truck, email) and visibility toggle.", type: "Feature"), // Comma
          (id: "5.1.4", feature: "System Sync", description: "Manual trigger buttons for syncing Sites/Customers/Drivers and Railcars; displays last sync log; includes file upload component.", type: "Feature"), // Comma
          (id: "5.1.5", feature: "Storage Configuration", description: "A sub-page existed but primarily showed raw site JSON via site selector; not a full config UI.", type: "Feature"), // TRAILING Comma
        ), // End requirements array for Section 5.1
      ), // << Comma BETWEEN Section 5.1 and Section 5.2
      ( // Start Section 5.2
        section_number: "5.2",
        title: "Storage Management",
        description: "Tools for measuring and reviewing storage tank levels.",
        requirements: ( // Start requirements array for Section 5.2
          (id: "5.2.1", feature: "Storage Measurement Input", description: "Interface to select site/group and input current percentage levels for each tank via sliders/inputs; calculates total volume; shows previous reading comparison.", type: "Feature"), // Comma
          (id: "5.2.2", feature: "Storage Measurement Review", description: "Interface to select site/group and view historical measurements in a table and a time-series line chart.", type: "Feature"), // TRAILING Comma
        ), // End requirements array for Section 5.2
      ), // << Comma BETWEEN Section 5.2 and Section 5.3
      ( // Start Section 5.3
        section_number: "5.3",
        title: "User Management & Auth",
        description: "Features for managing user accounts and authentication.",
        requirements: ( // Start requirements array for Section 5.3
          (id: "5.3.1", feature: "Admin: User List & Edit", description: "Table showing Name, Role, Default Site, Enabled status with inline editing and enable/disable toggle.", type: "Feature"), // Comma
          (id: "5.3.2", feature: "Admin: User Invitation", description: "Modal form to invite new users via email, assigning Name, Role, and optional Default Site.", type: "Feature"), // Comma
          (id: "5.3.3", feature: "User: Profile Management", description: "Dedicated page for users to change their own Name, Default Site, and Password (requires old password).", type: "Feature"), // Comma
          (id: "5.3.4", feature: "Auth: Forgot Password Flow", description: "Pages to request password reset and submit a new password with a token. V2 uses a modal for initiation, full flow unclear.", type: "Feature"), // Comma
          (id: "5.3.5", feature: "Auth: Accept Invitation Flow", description: "Page for a new user to accept an invitation and set their initial password. Missing in V2.", type: "Feature"), // TRAILING Comma
        ), // End requirements array for Section 5.3
      ), // TRAILING Comma after last section (Section 5.3)
    ), // End sections array for Module 5
  ), // << Comma BETWEEN Module 5 and Module 6

  ( // Start Module 6
    module_number: "6",
    title: "Reporting & Documentation",
    description: "Advanced reporting capabilities and document access.",
    sections: ( // Start sections array for Module 6
      ( // Start Section 6.1
        section_number: "6.1",
        title: "Advanced Reporting",
        description: "Specialized reporting modules with filtering and visualization.",
        requirements: ( // Start requirements array for Section 6.1
          (id: "6.1.1", feature: "Shrink Analysis", description: "Filter by site and month; displays stats, graph, and data table; XLSX export.", type: "Feature"), // Comma
          (id: "6.1.2", feature: "Run Rate Reports", description: "Filter by site; displays run rate metrics and inventory forecast chart.", type: "Feature"), // Comma
          (id: "6.1.3", feature: "Inventory Volume/Shrink Reporting", description: "Filter by date range, sites (multi-select), aggregation period; shows volume bar chart (cracked vs BOL) and rolling shrink % area chart; allows data backfill trigger and XLSX export.", type: "Feature"), // TRAILING Comma
        ), // End requirements array for Section 6.1
      ), // << Comma BETWEEN Section 6.1 and Section 6.2
      ( // Start Section 6.2
        section_number: "6.2",
        title: "Documentation & Help",
        description: "Pages for accessing documentation and help resources.",
        requirements: ( // Start requirements array for Section 6.2
          (id: "6.2.1", feature: "Document Listing", description: "Retrieves and displays document metadata (filename, description) from an API.", type: "Feature"), // Comma
          (id: "6.2.2", feature: "Document Download", description: "Provides buttons to trigger the download of specific documents.", type: "Feature"), // Comma
          (id: "6.2.3", feature: "Embedded Video Player", description: "Utilizes a video player component to show help videos.", type: "Feature"), // Comma
          (id: "6.2.4", feature: "Accordion Layout", description: "Organizes videos into expandable sections for different topics (BOL Entry, Railcar On Site, Pre-Unload, Pre-Release).", type: "Feature"), // TRAILING Comma
        ), // End requirements array for Section 6.2
      ), // TRAILING Comma after last section (Section 6.2)
    ), // End sections array for Module 6
  ), // TRAILING Comma after last module (Module 6)
) // End of the main modules array
  ),
  deliverables: (
    number: 4,
    deliverables: (
      (
        title: "Milestone 1: Core Functionality & Single Railcar View",
        milestone: "1",
        description: "Implementation of global site selection context and comprehensive single railcar view with all associated components.",
        acceptance: "Users can select different sites via dropdown, with data filtered accordingly. Railcar view displays all required information with history, BOLs, and comments functionality working as expected."
      ),
      (
        title: "Milestone 2: Railcar Workflows",
        milestone: "2",
        description: "Mobile-friendly pre-unload and pre-release inspection forms with all checklist elements, signature capture, and data persistence.",
        acceptance: "Both workflow forms are accessible on mobile devices, allow complete checklist completion, capture signatures, and successfully save all data with proper association to railcars."
      ),
      (
        title: "Milestone 3: Load Management Features",
        milestone: "3",
        description: "Load creation wizard, detailed load view with all associated functionality, and load amendment capabilities.",
        acceptance: "Users can create loads through the multi-step wizard, view complete load details with BOL download/email options, and successfully amend fields on completed loads."
      ),
      (
        title: "Milestone 4: System Settings & Management",
        milestone: "4",
        description: "Complete system settings administration, storage management tools, and user management functionality.",
        acceptance: "Administrators can successfully manage all system entities, record and view storage measurements, and complete all user management tasks including invitations and authentication flows."
      ),
      (
        title: "Milestone 5: Reporting & Documentation",
        milestone: "5",
        description: "Advanced reporting modules with visualization and export capabilities, plus documentation and help pages.",
        acceptance: "All reporting pages function as specified with correct filtering, visualization, and export options. Documentation and help pages display all resources with proper interaction."
      )
    )
  ),
  pricing: (
    number: 5,
    resources_needed: (),
    turbo_resources: (
      (role: "Project Lead", individual: "Zac Brooks"),
      (role: "FE Developer", individual: "Christopher Heffernan")
    ),
    client_resources: (
      (role: "Key Contact", individual: "David Settle"),
      (role: "Project Sponsor", individual: "Cody Jackson")
    ),
    milestone_costs: (
      (milestone: "1: Core Functionality & Single Railcar View", amount: "942.50", is_total: false),
      (milestone: "2: Railcar Workflows", amount: "1,153.75", is_total: false),
      (milestone: "3: Load Management Features", amount: "2,079.75", is_total: false),
      (milestone: "4: System Settings & Management", amount: "4,956.25", is_total: false),
      (milestone: "5: Reporting & Documentation", amount: "2,925.00", is_total: false),
      (milestone: "Total", total_number: 12057.50, amount: "12,057.50", is_total: true)
    ),
    bonus_percent: 0
  ),
  assumptions: (
    number: 6,
    assumptions: (
      (
        category: "Project Scope & Technical Environment",
        items: (
          "The scope is limited to implementing the missing features as specified in the scope document provided by Flashpoint Energy.",
          "The core structure of the V2 application is sound and compatible with the V1 features to be implemented.",
          "All features will match the functionality described in the scope document but may use updated UI patterns consistent with V2.",
          "Some refactoring of existing V2 code may be necessary to integrate V1 features seamlessly."
        )
      ),
      (
        category: "Access & Resources",
        items: (
   
          "Access to development and testing environments will be provided to Turbo Labs.",
               )
      ),
      (
        category: "Design & UI/UX",
        items: (
          "Visual design for migrated features will follow the established V2 design system while maintaining the core functionality of V1.",
          "UI/UX improvements may be suggested and implemented where appropriate, but major redesigns are out of scope unless explicitly requested and approved.",
          "Mobile-friendly layouts will be preserved for features that require them, such as the pre-unload and pre-release forms."
        )
      )
    ),
    dependencies: (
      (
        category: "Client Responsibilities",
        items: (
 
          "Timely Feedback: Prompt responses to questions and review of completed features.",
          "Testing Resources: Assistance with testing in client environments and validation of business rules.",
      
        )
      ),
      (
        category: "Technical Dependencies",
        items: (
          "API Compatibility: V2 backend APIs must support all required functionality from V1 features.",
          "Environment Stability: Development and testing environments must be stable and accessible.",
          "Third-Party Services: Any third-party services required for implementation must be available and accessible."
        )
      )
    )
  ),
  change_management: (
    number: 7,
    contact_name: "Zac Brooks"
  ),
  announcements: (
    number: 8
  ),
  approval: (
    number: 9
  )
)

// Use the template with positional parameters
#show: sow(
  // Company info (Turbo Labs)
  "Turbo Labs, Inc.",
  "2024 N Freedom Pl",
  "Fayetteville, AR",
  "Zac Brooks",
  "zac@turbo.inc",
  "501.733.2220",
  "../images/turbo-black.png",

  // Client contacts (Flashpoint Energy)
  "David Settle", // Project Manager
  "Key Contact",
  "Cody Jackson", // Technical Lead
  "Project Sponsor",

  // SOW detail
  "Implementation of V1 Features in V2 Application",

  // Basic SOW information
  "Statement of Work",
  "Flashpoint Energy V2 Feature Implementation",
  "Flashpoint Energy",
  "Flashpoint",
  "Turbo Labs, Inc.",
  "May 12, 2025",
  "June 16, 2025",
  "May 5, 2025",
  "This document and supporting materials contain confidential and proprietary business information of Turbo Labs, Inc. These materials may be printed or photocopied for use in evaluating the proposed project, but are not to be shared with other parties without written consent.",

  // Content data structure
  flashpoint_energy_data
)