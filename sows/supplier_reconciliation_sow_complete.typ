#import "../templates/sow_template.typ": *

// Define all SOW content for Supplier Reconciliation
#let supplier_reconciliation_data = (
  overview: (
    number: 1,
    purpose: [Develop a comprehensive invoice reconciliation system that automatically matches Bill of Lading (BOL) documents with supplier invoices, identifies discrepancies, and streamlines the approval workflow.],
    outcomes: (
      [Create an intelligent matching system that automatically pairs invoices with corresponding BOLs based on configurable criteria],
      [Establish a robust variance detection framework that flags discrepancies in volume, pricing, and tax calculations],
      [Provide detailed drill-in views for efficient comparison and analysis of invoice vs. BOL data],
      [Deliver intuitive dashboards for both operational users and management to track reconciliation progress],
      [Enable supplier-specific configurations for matching rules, variance thresholds, and approval workflows],
      [Support various invoice integration points and formats to accommodate different supplier systems],
    )
  ),
  timeline: (
    number: 2,
    dates: ("4/28", "5/5", "5/12", "5/19", "5/26", "6/2", "6/10",),
    milestones: (
      (
        number: "1",
        title: "Foundation & Core Configuration",
        schedule: ("", "1", "2", "", "", "", ""),
        description_text: [
          *Invoice Integration & Matching:* Set up background processes for invoice import from multiple sources. Implement BOL matching algorithm with configurable criteria. Develop variance detection and status assignment logic. Build integration connectors for primary supplier formats. \
          *Manage Suppliers:* Create supplier management interface. Implement supplier creation and configuration workflows. Develop data mapping functionality for supplier-specific fields. Set up user assignment capabilities. \
          *System/Supplier Configurations:* Build global configuration management interface. Implement supplier-specific override capabilities. Develop match criteria configuration (BOL number, date, supplier, terminal). Create variance threshold and warning configuration tools.
        ],
        approval_by: "Wes Geier (Product Lead)",
        target_date: "May 12, 2025"
      ),
      (
        number: "2",
        title: "Match View",
        schedule: ("", "", "1", "2", "", "", ""),
        description_text: [
          Develop status-based organization system. Create supplier grouping functionality. Implement quick action capabilities for workflow management. Build filtering and sorting functionality. Develop aggregate metrics calculation for grouped views.
        ],
        approval_by: "Wes Geier (Product Lead)",
        target_date: "May 12, 2025"
      ),
      (
        number: "3",
        title: "Invoice Drill-In View",
        schedule: ("", "", "", "1", "2", "", ""),
        description_text: [
           Develop Match Summary (side-by-side comparison). Implement Tax Comparison view with Avalara integration. Create Product Comparison view. Build Invoice Details display. Implement Audit History tracking. Manage Linked Invoices. Display Cost Formula Breakdown. Create BOL Matching Modal. Implement Match Drill-In Actions.
        ],
        approval_by: "Wes Geier (Product Lead)",
        target_date: "May 19, 2025"
      ),
      (
        number: "4",
        title: "Transaction Reports",
        schedule: ("", "", "", "", "1", "2", ""),
        description_text: [
          Develop transaction data grid. Implement tax component breakdown views. Create recalculation tools for tax adjustments. Build export functionality for reporting.
        ],
        approval_by: "Wes Geier (Product Lead)",
        target_date: "May 26, 2025"
      ),
      (
        number: "5",
        title: "Launchpad (Homepage)",
        schedule: ("", "", "", "", "1", "1", "2"),
        description_text: [
          Develop key metrics display with trend visualization. Implement activity feed for real-time updates. Create quick filters for personal assignments. Build supplier breakdown functionality. Integrate with all other modules for seamless navigation.
        ],
        approval_by: "Wes Geier (Product Lead)",
        target_date: "June 10, 2025"
      ),
      (
        number: "6",
        title: "Management Dashboard & Edge Cases",
        schedule: ("", "", "", "", "", "1", "2"),
        description_text: [
          Create progress tracking visualizations. Implement performance metrics calculations and displays. Develop supplier ranking and analysis tools. Build past due analysis functionality. Create drill-down capabilities for detailed investigation. Handle edge cases (Credit Rebill, Multi-Invoice, Movement Errors).
        ],
        approval_by: "Wes Geier (Product Lead)",
        target_date: "June 10, 2025"
      )
    )
  ),
  scope: (
    number: 3,
    in_scope_summary: [The features below are grouped by the milestone in which they are delivered. We are matching existing designs for this project, and any additional scope will be called out and refined during the process.],
    out_of_scope_summary: [
      #list([Handling any invoice integration logic or general endpoints.],
    [Creating automations or data generation to create testing data.  ],
    [Creating automated tests that test the whole module end to end (tests will be used to prove each piece defined in test cases).], 
    [Any UI showing the 'status' of an integration.]
  )],
    modules: ( // Top level now represents MILESTONES 1-6
      ( // MILESTONE 1 MODULE
        module_number: "1",
        title: "Foundation & Core Configuration",
        description: "Establishing the core data handling, supplier setup, and configuration rules for the reconciliation process.",
        sections: ( // Logical groupings within Milestone 1
          (
            section_number: "1.1", // Section 1 within Milestone 1
            title: "Invoice Integration & Matching",
            description: "Core background processes for invoice intake and automated matching against BOLs.",
            requirements: ( // Requirements within Section 1.1
              (id: "1.1.1", feature: "Invoice Integration", description: "Once a supplier is configured - the system will support bringing in invoices that come through for that supplier. The system will support multiple integration points and formats.", type: "Feature"), // New ID
              (id: "1.1.2", feature: "Matching Process", description: "Once invoices are brought into the system, on an interval, the system will create matches of BOL to invoice, using the matching criteria defined. It will assign status based on variance and match existence, and attach warnings to items based on the Warning Configuration, regardless of status found on the total comparison.", type: "Feature") // New ID
            )
          ),
          (
            section_number: "1.2", // Section 2 within Milestone 1
            title: "Supplier Setup & Management",
            description: "Creating and configuring supplier details, data mappings, and user assignments.",
            requirements: ( // Requirements within Section 1.2
              (id: "1.2.1", feature: "Supplier Management", description: "Suppliers will be required to be created for the invoices to flow into Gravitate. Once a supplier is created, users can override global settings for the supplier, map multiple supplier names to a single, and map reference data for that supplier's invoice data.", type: "Feature"), // New ID
              (id: "1.2.2", feature: "Data Mapping", description: "As the buyers use the system, better variance checking can happen as they map invoice data to Gravitate data. We will support this in a configuration grid, and being able to be applied inline.", type: "Feature"), // New ID
              (id: "1.2.3", feature: "User Assignment To Supplier", description: "Users can be assigned to suppliers, which will control the 'Assigned To Me' filters throughout the UX.", type: "Feature") // New ID
            )
          ),
          (
            section_number: "1.3", // Section 3 within Milestone 1
            title: "System & Matching Configuration",
            description: "Global and supplier-level settings for matching rules, warnings, and approvals.",
            requirements: ( // Requirements within Section 1.3
              (id: "1.3.1", feature: "Global Settings", description: "All of the supplier reconciliation settings, being Variance Settings + Match Criteria, can be defaulted for the system, but then overridden by a certain supplier.", type: "Feature"), // New ID
              (id: "1.3.2", feature: "Match Criteria Configuration", description: "Users can set what is valid for a match globally in the system, or override by supplier. This includes: BOL Number: Toggle requiring BOL number match for auto-matching. BOL Date:Toggle with additional hour configuration for date matching. Supplier Match:Toggle for requiring supplier name match (default off) . Terminal Match: Toggle for requiring terminal match.", type: "Feature"), // New ID
              (id: "1.3.3", feature: "Warning Thresholds", description: "Users can set what warning scenarios they would like to flag on matches, globally and then by supplier. These include:\nNet Variance Warning: Configurable dollar amount threshold for net variance warnings\nGross Variance Warning: Dollar amount threshold for gross variance warnings\nTax Variance Warning: Toggle for tax calculation variance warnings\nPer Unit Price Variance: Toggle for unit price variance warnings", type: "Feature"), // New ID
              (id: "1.3.4", feature: "Auto-approve Variance", description: "Supplier-specific dollar amount threshold for automatic approval", type: "Feature") // New ID
            )
          ),
        ) // End Sections for Milestone 1
      ), // End Milestone 1 Module

      ( // MILESTONE 2 MODULE
        module_number: "2",
        title: "Match View",
        description: "Developing the primary user workspace for viewing, managing, and acting upon invoice matches.",
        sections: (
          (
            section_number: "2.1", // Section 1 within Milestone 2
            title: "Match View Workspace",
            description: "The primary user interface features for viewing, filtering, and acting on invoice matches.",
            requirements: ( // Requirements within Section 2.1
               (id: "2.1.1", feature: "Match Report", description: "Groups invoices by supplier with detailed status breakdowns including matched, variance, waiting on supplier, and missing BOL categories. Each group shows aggregate metrics for volume and financial data with the ability to drill down into specific invoices.", type: "Feature"), // New ID
               (id: "2.1.2", feature: "Status Tabs", description: "Provides quick filters for supplier, assignment, and past due items with clear status indicators for each invoice state. The header aggregates key metrics for the current view including volume and amount due totals. Segments invoices into clear categories: Matched (Valid), Has Variance, Missing BOL, Waiting on Supplier, and Orphan BOL. Each tab provides a focused view of invoices in that particular state with relevant actions and information.", type: "Feature"), // New ID
               (id: "2.1.3", feature: "Actions", description: "The system shall enable immediate actions on invoices, marking items as ‘Waiting On Supplier’, Voiding, and Approval. This should be available on a single record, or in bulk.", type: "Feature"), // New ID
               (id: "2.1.4", feature: "Manually Create Invoice", description: "", type: "Feature") // New ID
            )
          ),
        ) // End Sections for Milestone 2
      ), // End Milestone 2 Module

      ( // MILESTONE 3 MODULE
        module_number: "3",
        title: "Invoice Drill-In View",
        description: "Building the detailed analysis view for comparing invoice and BOL data, investigating discrepancies, and managing related information.",
        sections: ( // Logical groupings within Milestone 3
          (
            section_number: "3.1", // Section 1 within Milestone 3
            title: "Core Data Comparison",
            description: "Side-by-side views comparing key Invoice and BOL data elements.",
            requirements: ( // Requirements within Section 3.1
             (id: "3.1.1", feature: "Match Summary", description: "Provides side-by-side comparison of invoice vs BOL data including gross volume, net volume, tax amount, and product amount with clear variance indicators. Automatically highlights discrepancies and provides explanatory hints about the nature of variances.", type: "Feature"), // New ID
             (id: "3.1.2", feature: "Tax Comparison", description: "Shows detailed breakdown of all tax components from both invoice and BOL, integrated with Avalara calculations. Enables line-by-line comparison of tax amounts with the ability to recalculate as needed.", type: "Feature"), // New ID
             (id: "3.1.3", feature: "Product Comparison", description: "Breaks down product-specific information including volume, price per unit, and total amount comparisons between invoice and BOL. Groups data by product when mappings exist and displays detailed variance analysis for each product line item.", type: "Feature"), // New ID
            )
          ),
          (
            section_number: "3.2", // Section 2 within Milestone 3
            title: "Contextual Information",
            description: "Details providing context about the invoice and its related entities.",
            requirements: ( // Requirements within Section 3.2
             (id: "3.2.1", feature: "Invoice Details", description: "Displays comprehensive invoice information with key fields and status indicators at the top of the page. Includes navigation arrows to move between invoices quickly while maintaining the current filter context.", type: "Feature"), // New ID
             (id: "3.2.2", feature: "Linked Invoices", description: "Manages relationships between multiple invoices tied to a single BOL, such as separate product and tax invoices or voided invoice scenarios. Shows aggregate totals across all linked invoices for accurate variance calculations.", type: "Feature"), // New ID
             (id: "3.2.3", feature: "Cost Formula Breakdown", description: "Displays the detailed pricing formula used for BOL valuation, showing each component that contributed to the final unit price. Enables users to verify pricing calculations and identify sources of price variances.", type: "Feature"), // New ID
            )
          ),
          (
            section_number: "3.3", // Section 3 within Milestone 3
            title: "Interaction and Audit",
            description: "Tools for resolving issues, linking documents, and tracking history.",
            requirements: ( // Requirements within Section 3.3
             (id: "3.3.1", feature: "Audit History", description: "Shows complete timeline of all actions taken on the invoice including status changes, user assignments, and supplier communications. Maintains a searchable comment thread for team collaboration and issue tracking.", type: "Feature"), // New ID
             (id: "3.3.2", feature: "BOL Matching Modal", description: "Intelligent search interface for finding and linking missing BOLs, with suggested matches and customizable filters. Includes comprehensive search criteria, quick preview capabilities, and bulk matching tools. Provides a Kayak-style suggestion system with filter options to help users find the correct BOL efficiently.", type: "Feature"), // New ID
             (id: "3.3.3", feature: "Match Drill-In Actions", description: "Users can take actions on a match, modifying statuses, handling edge case scenarios, and providing better visibility on the match.", type: "Feature") // New ID
            )
          ),
        ) // End Sections for Milestone 3
      ), // End Milestone 3 Module

      ( // MILESTONE 4 MODULE
        module_number: "4",
        title: "Transaction Reports",
        description: "Developing reporting capabilities for detailed transaction analysis and data export.",
        sections: (
          (
            section_number: "4.1", // Section 1 within Milestone 4
            title: "Transaction Reporting",
            description: "Features for viewing detailed transaction grids, tax breakdowns, and performing recalculations.",
            requirements: ( // Requirements within Section 4.1
               (id: "4.1.1", feature: "Transaction Data Grid", description: "Comprehensive grid showing order details including order number, BOL number, type, status, delivery date, counterparty, contract number, terminal, product details, volumes, and amounts", type: "Feature"), // New ID
               (id: "4.1.2", feature: "Tax Component Breakdown", description: "Detailed view of individual tax components from both invoice and BOL sides", type: "Feature"), // New ID
               (id: "4.1.3", feature: "Recalculation Tools", description: "Capability to recalculate tax amounts to handle Avalara issues out of the systems control. *Note - if the Order Movement has not been exported, changing the price / BOL information will automatically recalculate the tax values.", type: "Feature") // New ID
            )
          ),
        ) // End Sections for Milestone 4
      ), // End Milestone 4 Module

      ( // MILESTONE 5 MODULE
        module_number: "5",
        title: "Launchpad (Homepage)",
        description: "Creating the central user dashboard for at-a-glance status updates and quick access to tasks.",
        sections: (
          (
            section_number: "5.1", // Section 1 within Milestone 5
            title: "Homepage Components",
            description: "Elements of the user's main dashboard including metrics, activity, filters, and supplier overview.",
            requirements: ( // Requirements within Section 5.1
              (id: "5.1.1", feature: "Key Metrics Display", description: "Provides immediate visibility into system performance through key metrics including automatch percentage, total past due, total open items, and total orphan BOLs. Each metric includes trend visualization and configurable thresholds for alerts.", type: "Feature"), // New ID
              (id: "5.1.2", feature: "Activity Feed", description: "Shows a real-time feed of comments and updates for items assigned to the current user. Comments can be clicked to navigate directly to the relevant invoice or BOL.", type: "Feature"), // New ID
              (id: "5.1.3", feature: "Quick Filters", description: "Enables users to quickly toggle between personal assignments and different status views with the \"Assign to me\" feature. Includes powerful filtering capabilities for supplier, terminal, and status-based views. This will all lead to the 'match' view.", type: "Feature"), // New ID
              (id: "5.1.4", feature: "Supplier Breakdown", description: "Displays comprehensive breakdown by supplier including buyer information, invoice count, BOL count, and past due amount. Users can drill down into terminal-specific data and filter by multiple dimensions.", type: "Feature"), // New ID
              (id: "5.1.5", feature: "Top 10 Oldest Invoices", description: "The Top 10 Oldest Invoices widget lists outstanding invoices in chronological order, showing invoice numbers, suppliers, status, invoice dates, days until due (or overdue), and amounts due, with a total sum of all displayed invoices at the bottom.", type: "Feature"), // New ID
              (id: "5.1.6", feature: "Invoice Overview", description: "A widget that displays three key metrics with counts and drill-down capabilities: Unmatched, Needs Attention, and Waiting on Suppliers, each with a breakdown of the top suppliers affected in these categories and their respective counts.", type: "Feature") // New ID
            )
          ),
        ) // End Sections for Milestone 5
      ), // End Milestone 5 Module

      ( // MILESTONE 6 MODULE
        module_number: "6",
        title: "Management Dashboard & Edge Cases",
        description: "Providing high-level oversight tools and ensuring robust handling of non-standard scenarios.",
        sections: ( // Logical groupings within Milestone 6
          (
            section_number: "6.1", // Section 1 within Milestone 6
            title: "Management Dashboard Analytics",
            description: "High-level tracking, supplier analysis, and performance metrics for managers.",
            requirements: ( // Requirements within Section 6.1
              (id: "6.1.1", feature: "Progress Tracking", description: "Visual representation of reconciliation progress showing status distribution across all invoices. Visual breakdown of invoices across different statuses with trend analysis.", type: "Feature"), // New ID
              (id: "6.1.2", feature: "Top Suppliers By Status", description: "Ranked list of suppliers by outstanding amounts with detailed aging analysis, from different points of view.", type: "Feature"), // New ID
              (id: "6.1.3", feature: "Performance Metrics", description: "Real-time tracking of key performance indicators including automatch rates and processing times", type: "Feature"), // New ID
              (id: "6.1.4", feature: "Past Due Analysis", description: "Multi-dimensional view of past due items broken down by time periods (3-day, 7-day, 20-day) with drill-down capabilities", type: "Feature"), // New ID
              (id: "6.1.5", feature: "Top 10 Past Due By Supplier", description: "The Past Due by Supplier widget displays a tabular list of your top vendors with outstanding balances, showing each supplier name, number of orders, number of invoices, and total amount due, with a summary row calculating overall totals across all displayed suppliers.", type: "Feature"), // New ID
              (id: "6.1.6", feature: "Late Payment Summary", description: "The Late Payment Summary widget displays invoices with past due amounts, showing invoice numbers, supplier names, payment due dates, and total amounts owed, with a summary row calculating the overall amount due across all listed invoices.", type: "Feature") // New ID
            )
          ),
          (
            section_number: "6.2", // Section 2 within Milestone 6
            title: "Edge Case Handling",
            description: "System capabilities for managing non-standard scenarios like credit/rebills and movement errors.",
            requirements: ( // Requirements within Section 6.2
              (id: "6.2.1", feature: "Credit Rebill Handling", description: "The system should provide visibility when multiple invoice matches are found for a BOL - and provide quick actions for users to void, yet still see them in the invoice group. Credit invoices should be automatically detected. System will show the items in the group properly and their type.", type: "Feature"), // New ID
              (id: "6.2.2", feature: "Multiple Invoices -> Single BOL", description: "The system should gracefully handle multiple invoices to a single BOL, and aggregate the values accordingly.", type: "Feature"), // New ID
              (id: "6.2.3", feature: "Exposing BOLs With Movement Errors", description: "Giving the user visibility that a match exists but has not been propagated through the flow.", type: "Feature") // New ID
            )
          ),
        ) // End Sections for Milestone 6
      ), // End Milestone 6 Module

    ) // End scope.modules
  ), // End scope
  deliverables: (
    number: 4,
    deliverables: (
       (
        title: "Documentation",
        milestone: "Each Milestone",
        description: "Each in scope item will be documented with: Internal (Object Documentation, Process Documentation) and External (User Documentation).",
        acceptance: "Reviewed and approved by Gravitate Product Lead (Wes Geier). Documentation must be comprehensive for internal and external use cases as described."
      ),
      (
        title: "Working Software",
        milestone: "Each Milestone",
        description: "The software will be built, hitting a real backend, developed in the dev environment.",
        acceptance: "Reviewed and approved by Gravitate Product Lead (Wes Geier). Software must demonstrate functionality linked to a backend system within the development environment."
      ),
      (
        title: "Automated Test",
        milestone: "Each Milestone",
        description: "Each in scope item will have automated tests that can be ran, proving its functionality and reducing QA burden throughout the process.",
        acceptance: "Reviewed and approved by Gravitate Product Lead (Wes Geier). Automated tests must exist, be runnable, and verify the functionality of the delivered scope items."
      )
    )
  ),
  pricing: (
    number: 5,
    resources_needed: (),
    turbo_resources: (
      (role: "Project Lead", individual: "ZAC BROOKS"),
      (role: "Lead Dev", individual: "TBD"),
      (role: "FE Dev", individual: "MICHAEL JONES"),
      (role: "Design Support", individual: "VYTAS BU")
    ),
    client_resources: (
      (role: "Project Sponsor", individual: "MIKE SCHARF"),
      (role: "Product Lead", individual: "WES GEIER"),
      (role: "BE Lead", individual: "NATHAN TURNER"),
      (role: "Product Resource", individual: "MASON CLEMENS"),
      (role: "QA Lead", individual: "CHRISTINE FLETCHER")
    ),
    milestone_costs: (
      (milestone: "1: Foundation & Core Configuration", amount: [19,440], is_total: false),
      (milestone: "2: Match View", amount: [11,520], is_total: false),
      (milestone: "3: Invoice Drill-In View", amount: [22,680], is_total: false),
      (milestone: "4: Transaction Reports", amount: [10,080], is_total: false),
      (milestone: "5: Launchpad (Homepage)", amount: [7,560], is_total: false),
      (milestone: "6: Mgmt Dashboard & Edge Cases", amount: [13,680], is_total: false),
      (milestone: "Total", total_number: 84960,amount: [84,960], is_total: true)
    ),
    bonus_percent: 0
  ),

 assumptions: (
    number: 6, // This is Section #6
    assumptions: ( // List of assumption categories
      (
        category: "Scope & Design Definition",
        items: (
          "The scope of work is based on the features and requirements detailed in this document (SOW #5).",
          "User interface designs, where applicable, serve as a primary source of truth for front-end development scope and user interaction patterns.",
          "Any significant deviation or evolution discovered during implementation regarding designs or requirements will be addressed through the Change Management process (Section #7)."
        )
      ),
      (
        category: "Testing & Acceptance Process",
        items: (
          "Specific test cases and detailed acceptance criteria for features will be collaboratively refined and agreed upon at the beginning of or during each milestone.",
          "Turbo Labs will own the development and execution of automated tests covering the in-scope requirements.",
          "Gravitate (specifically the Product Lead) will own the final review and approval/rejection of milestone deliverables based on the agreed-upon scope and acceptance criteria."
        )
      ),
      (
        category: "Resource Availability & Collaboration",
        items: (
          "Key personnel from both Turbo Labs and Gravitate, as listed in the Resources section (#5), will be available for necessary meetings, discussions, and reviews.",
          "Open communication channels (e.g., Slack, scheduled meetings) will be maintained and actively used by both parties."
        )
      ),
    ), // End of assumptions list
    dependencies: ( // List of dependency categories
      (
        category: "Client Responsibilities (Gravitate)",
        items: (
          "Timely Feedback & Approval: Feedback and formal approval/rejection on milestone deliverables will be provided by Gravitate stakeholders (primarily Product Lead) within 2-3 business days of submission to maintain the project schedule.",
          "Invoice Data Availability: Functional invoice integration points providing valid, representative invoice data must be available and accessible in the development/testing environment before the start of Milestone 2 testing.",
          "Access to Personnel: Timely access to Gravitate's technical (BE Lead) and product resources for requirement clarification, integration support, and issue resolution.",
          "Environment Access: Access to necessary development, testing environments, and associated credentials if required for integration or deployment."
        )
      ),
      (
        category: "Technical Dependencies",
        items: (
          "Availability of any required external services (e.g., Avalara for tax calculations, specific supplier endpoints) in test environments.",
          "Backend endpoints required by the frontend features will be provided by Gravitate's BE team in alignment with the project milestones."
        )
      ),
    ) // End of dependencies list
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

// Use the template with positional parameters in the exact order specified
#show: sow(
  // Company info (Turbo Labs) - Assuming placeholder details
  "Turbo Labs, Inc.",
  "456 Innovation Drive", // Placeholder address
  "Tech City, ST 98765", // Placeholder
  "Zac Brooks", // Primary contact from SOW Resources
  "zac.brooks@turbolabs.fake", // Placeholder email
  "555-0101", // Placeholder phone
  "../images/turbo-black.png", // Placeholder logo from example

  // Client contacts (Gravitate) - Mapping roles from SOW Resources to example slots
  "Mike Scharf", // Project Sponsor -> Maps to Executive Sponsor Slot
  "CEO",         // Role of Mike Scharf
  "Wes Geier",   // Product Lead -> Maps to Product Owner Slot
  "Product Lead",// Role of Wes Geier

  // SOW detail (Short Description)
  "Build a full-featured supplier reconciliation module for Gravitate.",

  // Basic SOW information
  "Statement of Work", // Document Type
  "Supplier Reconciliation (SOW #5)", // Project Name / SOW Title
  "Gravitate Energy, LLC", // Client Name
  "Gravitate", // Client Short Name
  "Turbo Labs, Inc.", // Provider Name
  "April 28, 2025", // Project Start (Formatted)
  "June 10, 2025", // Project End (Formatted)
  "April 6, 2024", // Created Date (Formatted)
  "This document and supporting materials contain confidential and proprietary business information of Turbo Labs, inc. These materials may be printed or photocopied for use in evaluating the proposed project, but are not to be shared with other parties", // Confidentiality Statement

  // Content data structure
  supplier_reconciliation_data
)