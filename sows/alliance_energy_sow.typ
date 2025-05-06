#import "sow_template.typ": *

// Define all SOW content for Alliance Mobile App Revival
#let alliance_mobile_revival_data = (
  overview: (
    number: 1,
    purpose: [Revive an existing Alliance Energy mobile application by updating outdated packages, ensuring Expo compatibility, applying Alliance branding, and connecting to required Alliance APIs. This effort involves significant upgrades across approximately 7 major versions.],
    outcomes: (
      [Updated mobile application source code with current dependencies.],
      [Mobile application compatible and runnable with the current Expo framework.],
      [Application user interface updated with Alliance Energy branding guidelines.],
      [Application successfully connecting to and interacting with specified Alliance Energy APIs.],
      [Completion of necessary major version upgrades to the underlying frameworks/libraries.]
    )
  ),
  timeline: (
    number: 2,
    // Dates representing the start and end columns for the short schedule
    dates: ("4/28", "4/30"),
    milestones: (
      (
        number: "1",
        title: "Mobile App Revival & Update",
        // Schedule indicating work spans across the defined dates
        schedule: ("1", "2"),
        description_text: [
          *Dependency & Expo Upgrade:* Identify and update outdated packages to stable, compatible versions. Resolve compatibility issues with the current Expo framework. Execute necessary framework and library upgrades, estimated at 7 major versions. \
          *Branding Implementation:* Integrate Alliance Energy logos, color schemes, and other branding elements as specified. \
          *API Integration:* Update and verify application connectivity and data exchange with the designated Alliance Energy API endpoints.
        ],
        // Approval by the main point of contact at capSpire
        approval_by: "Bhuvan Sethi (capSpire Digital)",
        // Target date reflects the end of the short engagement
        target_date: "April 30, 2025"
      ),
    ) // End milestones tuple
  ), // End timeline dictionary
  scope: (
    number: 3,
    in_scope_summary: [This SOW covers the technical effort required to update and revive the existing Alliance Energy mobile application as described. The focus is on dependency management, Expo compatibility, branding, and API connectivity.],
    out_of_scope_summary: [ #list(
        [Development of new features not present in the original application.],
        [Major architectural refactoring beyond what is necessary for version upgrades and Expo compatibility.],
        [Development or modification of the Alliance Energy backend APIs.],
        [Server-side infrastructure setup or management.],
        [Creation of extensive end-to-end automated test suites (basic functional testing is included).],
        [User acceptance testing (UAT) coordination beyond basic demonstrations.],
        [App store submission or management.]
    )],
    modules: ( // Represents the single phase/milestone of work
      (
        module_number: "1",
        title: "Mobile App Revival & Update",
        description: "Focused effort to modernize the app's dependencies, ensure Expo functionality, apply branding, and connect to APIs.",
        sections: ( // Logical groupings within the milestone
          (
            section_number: "1.1",
            title: "Dependency & Expo Upgrade",
            description: "Bringing the application's core libraries and framework compatibility up to date.",
            requirements: (
              (id: "1.1.1", feature: "Package Updates", description: "Audit and update all critical npm packages to current, stable versions compatible with Expo and each other.", type: "Task"),
              (id: "1.1.2", feature: "Expo Compatibility", description: "Ensure the application builds, runs, and functions correctly within the modern Expo ecosystem.", type: "Task"),
              (id: "1.1.3", feature: "Version Upgrades", description: "Perform necessary code modifications to support upgrades across approximately 7 major versions of key underlying frameworks (e.g., React Native, Expo SDK).", type: "Task")
            )
          ),
          (
            section_number: "1.2",
            title: "Branding & API Integration",
            description: "Applying visual identity and ensuring backend communication.",
            requirements: (
              (id: "1.2.1", feature: "Alliance Branding", description: "Implement Alliance Energy branding (logos, colors, fonts) based on assets provided by the client.", type: "Task"),
              (id: "1.2.2", feature: "API Connectivity", description: "Verify and, if necessary, update application code to correctly consume Alliance Energy APIs for core functionality.", type: "Task")
            )
          ),
        ) // End Sections for Milestone 1
      ), // End Milestone 1 Module
    ) // End scope.modules
  ), // End scope
  deliverables: (
    number: 4,
    deliverables: (
      (
        title: "Updated Mobile Application Source Code",
        milestone: "1: Mobile App Revival & Update",
        description: "Complete source code repository containing the updated application with modernized dependencies, Expo compatibility, applied branding, and functional API integrations.",
        acceptance: "Code review and confirmation of successful build/run by Bhuvan Sethi (capSpire Digital)."
      ),
      (
        title: "Basic Functional Test Report",
        milestone: "1: Mobile App Revival & Update",
        description: "A brief report or demonstration confirming the application launches, core navigation works, branding is applied, and basic API calls are successful.",
        acceptance: "Review and approval by Bhuvan Sethi (capSpire Digital)."
      ),
      (
        title: "Runnable Expo Development Build",
        milestone: "1: Mobile App Revival & Update",
        description: "Instructions or access enabling the client to run the updated application within their own Expo development environment.",
        acceptance: "Successful launch and basic operation verified by Bhuvan Sethi (capSpire Digital)."
      )
    )
  ),
  pricing: (
    number: 5,
    resources_needed: (), // Assuming no specific external resources needed beyond client contacts
    turbo_resources: ( // Resources from your company (Turbo Labs)
      (role: "Lead Developer / Engineer", individual: "Zac Brooks"), // Adjust role/individual as needed
      (role: "Project Contact", individual: "Zac Brooks")     // Assuming Zac Brooks is the contact
    ),
    client_resources: ( // Resources from capSpire and potentially Alliance
      (role: "Primary Contact (capSpire)", individual: "Bhuvan Sethi"),
      (role: "Technical Contact (Alliance Energy)", individual: "Brandon"), // Alliance contact for API/Branding specifics
      (role: "Technical Lead", individual: "Mack Farid") // Who provides logos/guidelines?
    ),
    milestone_costs: (
      // Simplified pricing for a short T&M-like effort, representing the estimated cost
      // Adjust the amount based on actual agreement (e.g., fixed price or T&M estimate)
      (milestone: "1: Mobile App Revival & Update (1.5 days effort)", amount: [2,400], is_total: false), // Example amount
      (milestone: "Total Estimated Cost", total_number: 2400, amount: [2,400], is_total: true) // Example amount
    ),
    bonus_percent: 0 // Assuming no bonus for this short project
  ),
  assumptions: (
    number: 6,
    assumptions: (
      (
        category: "Project Scope & Starting Point",
        items: (
          "The scope is strictly limited to reviving the existing application as defined in Section 1 & 3.",
          "The original application source code will be provided by capSpire Digital and is in a state where it can be analyzed and updated.",
          "The '7 major versions' upgrade estimate is based on initial assessment and may require adjustments handled via Change Management if unforeseen complexities arise.",
          "No new features or significant UX/UI redesigns are included beyond branding application."
          )
      ),
      (
        category: "Technical Environment & Access",
        items: (
          "Access to the complete, latest version of the mobile application source code repository will be provided at project start.",
          "Clear documentation, endpoints, and necessary credentials/tokens for the Alliance Energy APIs required by the app will be provided.",
          "Required Alliance Energy branding assets (logos, color codes, font names) will be provided in suitable formats.",
          "Any specific Expo or development environment setup requirements beyond standard practices will be communicated by the client."
        )
      ),
      (
        category: "Resource Availability",
        items: (
          "Bhuvan Sethi (capSpire) will be available for timely decisions and feedback during the 4/28-4/30 period.",
          "An Alliance Energy technical contact will be available to answer API or branding-specific questions promptly."
        )
      ),
    ), // End assumptions list
    dependencies: (
      (
        category: "Client Responsibilities (capSpire / Alliance)",
        items: (
          "Provision of Source Code: Delivery of the application source code repository.",
          "Provision of API Details: Delivery of API documentation, endpoints, and credentials.",
          "Provision of Branding Assets: Delivery of logos, color palettes, font information.",
          "Timely Feedback: Prompt responses (within hours) to clarification requests during the short engagement.",
          "Access to Personnel: Ensuring availability of Bhuvan Sethi and the Alliance technical contact."
        )
      ),
      (
        category: "Technical Dependencies",
        items: (
          "Functional Alliance Energy APIs: The required backend APIs must be available and functional in a testable environment.",
          "Expo Environment: A standard Expo development environment is assumed to be sufficient."
        )
      ),
    ) // End dependencies list
  ), // End assumptions dictionary
  change_management: (
    number: 7,
    // Assuming Zac Brooks is the primary contact at Turbo Labs for changes
    contact_name: "Zac Brooks"
  ),
  announcements: (
    number: 8
    // Content likely handled by the template
  ),
  approval: (
    number: 9
    // Content likely handled by the template
  )
) // End main data structure


// Use the template with positional parameters
#show: sow(
  // Company info (Turbo Labs) - Assuming placeholder details from example
  "Turbo Labs, Inc.",
  "456 Innovation Drive", // Placeholder address
  "Tech City, ST 98765", // Placeholder
  "Zac Brooks", // Primary contact from Turbo Labs
  "zac.brooks@turbolabs.fake", // Placeholder email
  "555-0101", // Placeholder phone
  "turbo-black.png", // Placeholder logo from example

  // Client contacts (capSpire Digital)
  // Mapping Bhuvan Seth to the primary operational contact role
   "Bhuvan Sethi", // Product Owner / Main Contact Slot
  "Associate Partner",
  "", // Executive Sponsor Slot - Left blank or specify if known
  "", // Role of Executive Sponsor
 

  // SOW detail (Short Description)
  "Revive and update the Alliance Energy mobile application.",

  // Basic SOW information
  "Statement of Work", // Document Type
  "Alliance Energy Mobile App Revival (SOW #1)", // Project Name / SOW Title (Use a real ID)
  "capSpire Digital",
  "capSpire", // Client Short Name
  "Turbo Labs, Inc.", // Provider Name
  "April 28, 2025", // Project Start Date (Formatted)
  "April 30, 2025", // Project End Date (Formatted)
  "April 27, 2025", // Created Date (Formatted - Use current date)
  "This document and supporting materials contain confidential and proprietary business information of Turbo Labs, Inc. These materials may be printed or photocopied for use in evaluating the proposed project, but are not to be shared with other parties without written consent.", // Confidentiality Statement

  // Content data structure
  alliance_mobile_revival_data
)