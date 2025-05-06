#let cover_page(
  // Your Company Info
  company_name: "turbo labs, inc.",
  company_address_line1: "2024 N Freedom Pl",
  company_address_line2: "Fayetteville, AR", // Location hint
  contact_person: "Zac Brooks",
  contact_email: "zac@turbo.inc",
  contact_phone: "501.733.2220",
  logo_path: "../images/turbo-black.png", // <<< REPLACE with your logo path

  // SOW Details (Passed from main sow function)
  title: "Statement Of Work",
  subtitle: "",
  sow_detail: "", // You might want to pass this explicitly or derive it

  // Client Info (Passed from main sow function)
  client_name: "Client Name",
  client_contact1_name: "Client Contact 1",
  client_contact1_title: "Title",
  client_contact2_name: "Client Contact 2",
  client_contact2_title: "Title",

  // Dates (Passed from main sow function)
  created_date: "Creation Date",
  project_start: "Project Start Date",

  // Confidentiality (Passed from main sow function)
  confidentiality_text: "Default Confidentiality Text",

  
  background_image_path: "cover-image.png"
) = {

  set page(
    margin: (top: 1in, bottom: 0pt, x: 0pt), 
    numbering: none,
    footer: none,
  )

  grid(
    inset: (x: 0.5in), // Add inset to maintain original margin for header
    columns: (1fr, 1fr, auto),
    gutter: 1em,
    [#text(weight: "medium")[Turbo Labs, Inc.] \ 2024 N Freedom Pl \ Fayetteville, AR],
    [#text(weight: "medium")[#contact_person] \ zac\@turbo.inc \ 501-733-2220],
    align(right)[#image(logo_path, width: 6cm)] // Adjust logo width
  )

  // === Vertical Spacer ===
  v(2fr)

  // === Title Section ===
  block(inset: (left: 1in, right: 0.5in))[ // Apply inset for left margin
      #grid(
        inset: (x: 0.25in),
        columns: (auto, 1fr),
        column-gutter: 1em, // Space between line and text
        // Vertical line (using a thin rectangle)
        align(top, // Align rect to top of cell
          rect(width: 2pt, height: 4cm, fill: black) // Changed height from 100% to 4cm
        ),
        // Text block using stack for vertical layout
        stack(
          spacing: 1.5em, // Adjust vertical spacing between text elements
          text(size: 48pt)[#title],
          v(1cm),
          text(size: 18pt, weight: "medium")[#subtitle],
          text(size: 12pt)[#sow_detail]
        )
      )
  ]

  // === Vertical Spacer ===
  v(1fr)

  // === INSERT IMAGE HERE ===
  // Check if the path is provided before trying to display
  if background_image_path != none {
    align(center)[ // Or align as needed
      // Adjust width/height as needed to get the "chopped off" effect
      #image(background_image_path, width: 80%, height: 8cm, fit: "contain")
    ]
    // Add space after the image if needed, adjust or remove v(1fr) above as necessary
    // v(0.5fr) 
  }

  // === Footer Section (Prepared For) ===
  block(
    width: 100%,
    fill: rgb("#3A3A3A"),
    inset: (x: 2em, top: 1.5em, bottom: 1.5em),
    radius: 0pt,
    above: 0pt,
    [
      #set text(fill: white)

      // === New Main Footer Grid ===
      #grid(
        columns: (3fr, 1fr), // Left column takes more space
        column-gutter: 2em,

        // --- Left Column Content (Prepared For & Contacts) ---
        stack(
          dir: ttb, // Arrange vertically
          spacing: 3em, // Space between Prepared For and Contacts sections
          // Prepared For Section (using original stack)
          stack(
            dir: ttb, // Top-to-bottom direction
            spacing: 0.5cm, // Use stack spacing instead of #v
            // Removed v(1em) - relying on stack spacing and block inset
            text(size: 1.1em)[Prepared For:],
            text(size: 2.2em, weight: "medium")[#client_name]
          ),
          // Client Contacts Section (using a grid for horizontal layout)
          grid(
            columns: (1fr, 1fr), // Two equal columns for contacts
            rows: (auto),
            column-gutter: 2em,
            [#text(weight: "medium")[#client_contact1_name] \ #client_contact1_title],
            [#text(weight: "medium")[#client_contact2_name] \ #client_contact2_title]
            // Removed the empty third column from the original grid
          )
        ),

        // --- Right Column Content (Dates) ---
        align(top + right, // Align content to top-right of this column
          stack(
            dir: ttb, // Outer stack: space between Created/Project Start blocks
            spacing: 4em, // Adjust overall spacing between date blocks
            // Inner stack for "Created" label and date
            stack(
              dir: ttb,
              spacing: 0.75em, // Small spacing between label and date
              text(size: 1.1em)[Created:],
              text(size: 1.1em, weight: "medium")[#created_date] // Use standard variable insertion
            ),
            // Inner stack for "Project Start" label and date
            stack(
              dir: ttb,
            spacing: 0.75em, 
              text(size: 1.1em)[Project Start:],
              text(size: 1.1em, weight: "medium")[#project_start] // Use standard variable insertion
            )
          )
        )
      )

      #v(2.5em) // Keep vertical space before confidentiality line

      // --- Confidentiality Statement ---
      #line(length: 100%, stroke: white.darken(40%))
      #v(1em)
      #text(size: 9pt, style: "italic")[
        #text(weight: "medium")[Statement of Confidentiality] #h(0.5em)
        #confidentiality_text
      ]
    ] // End of dark block
  )

 
}
#let format-currency(amount) = {
  // Use .display() to format the number
  let formatted-number = amount.display(
    grouping-separator: ",",      // Comma for thousands
    minimum-fraction-digits: 2,  // Always show two decimal places
    maximum-fraction-digits: 2
  )
  // Prepend the dollar sign and return the string
  "$" + formatted-number
}

#let space_wrapper(content) = {
  block(above: 0.5cm, below: 0.5cm)[
    #content
  ]
}
#let heading_1(content) = {
  space_wrapper(
    text(size: 24pt)[#content]
  )
}

#let heading_2(content) = {
  v(0.25cm)
  space_wrapper(
    text(size: 24pt)[#content]
  )
  v(0.25cm)
  line(length: 100%, stroke: gray)
}
#let heading_3(content, description) = {
  v(0.25cm)
  space_wrapper(
    text(size: 18pt, weight: "medium")[#content]
  )
  description
  v(0.25cm)
  line(length: 100%, stroke: gray)
}
#let heading_4(content, description) = {
  v(0.25cm)
  space_wrapper(
    text(size: 12pt, weight: "medium")[#upper(content)]
  )
  description
  v(0.25cm)
  line(length: 100%, stroke: gray)
}
#let section_heading(number, content) = {
  set text(weight: "medium", size: 14pt)
  v(2cm)
  [#number. #content]
  v(0.3cm)
}

#let subsection_heading(content) = {
  set text(weight: "medium", size: 12pt)
  v(0.5cm)
  [#content]
  v(0.2cm)
}

// Section 1: Description of Services (reusing the Overview section)
#let section_description_of_services(number, purpose, outcomes) = {
  v(1cm)
  heading_2([#number. Description of Services])
  v(1cm)
  grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #text(weight: "medium")[PURPOSE]
      #v(0.5em)
      #purpose
    ],
    [
      #text(weight: "medium")[TARGET OUTCOMES]
      #v(0.5em)
      #list(..outcomes)
    ]
  )
}

// Section 2: Work Schedule and Location
#let section_work_schedule_location(number) = {
  v(1cm)
  heading_2([#number. Work Schedule and Location])
  
  v(0.5cm)
  [Services will be performed on an hourly basis. All work will be performed remotely unless otherwise specified.]
  
  v(0.5cm)
}

// Section 3: Assigned Personnel (reusing the resources table)
#let section_assigned_personnel(number, turbo_resources) = {
  v(1cm)
  heading_2([#number. Assigned Personnel])
  
  v(0.5cm)
  [The following resources will be assigned to this project:]
  
  v(0.5cm)
  
  // Turbo Resources Table
  block(
    radius: 4pt,
    stroke: rgb("#00000022"),
    width: 100%,
    clip: true,
    [
      #table(
        columns: (auto, 1fr),
        inset: 8pt,
        align: left,
        stroke: rgb("#00000022"),
        fill: (col, row) => if row == 0 { rgb("#F0F0F0") },
        
        // Header
        [#text(weight: "medium")[ROLE]], [#text(weight: "medium")[INDIVIDUAL]],
        
        // Data rows
        ..turbo_resources.map(r => (
          r.role,
          text(weight: "medium")[#r.individual]
        )).flatten()
      )
    ]
  )
  
  v(0.5cm)
}

// Section 4: Fees and Expenses (hour-focused)
#let section_fees_and_expenses(number, milestone_costs) = {
  v(1cm)
  heading_2([#number. Fees and Expenses])
  
  v(0.5cm)
  [Services will be billed at a rate of \$100 per hour. The following is the estimated fee structure for this statement of work:]
  
  v(0.5cm)
  
  // Hourly Rate Table
  block(
    radius: 4pt,
    stroke: rgb("#00000022"),
    width: 100%,
    clip: true,
    [
      #table(
        columns: (1fr, 1fr, 1fr, 1fr),
        inset: 8pt,
        align: (left, center, center, right),
        stroke: rgb("#00000022"),
        fill: (col, row) => {
          if row == 0 { rgb("#F0F0F0") }
          else if row == 2 { rgb("#3A3A3A") }
        },
        
        // Header row
        [#text(weight: "medium")[DESCRIPTION]], 
        [#text(weight: "medium")[HOURS]], 
        [#text(weight: "medium")[RATE]], 
        [#text(weight: "medium")[AMOUNT]],
        
        // Data row
        [Mobile App Revival & Update],
        [24],
        [\$100/hr],
        [\$2,400],
        
        // Total row
        text(fill: white, weight: "medium")[TOTAL],
         text(fill: white, weight: "medium")[],
        table.cell(colspan: 2)[
          #align(right)[
            #text(size: 14pt, fill: white, weight: "medium")[\$2,400]
          ]
        ]
      )
    ]
  )
  
  v(0.5cm)
  
  // Payment Terms Section
  heading_4([PAYMENT TERMS], none)
  
  [Payment for services will be invoiced at the completion of the project. Hours will be billed as incurred.]
  
  v(1em)
  
  grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    [
      Any additional hours required beyond the estimate will be approved in writing before being incurred.
      
      #text(style: "italic")[Due to the accelerated nature of this process, invoices will be sent with a due date of Net 15.]
    ],
    align(right)[
      #stack(
        spacing: 0.5em,
        text(size: 10pt, weight: "medium")[TOTAL PAYMENT],
        text(size: 16pt)[\$2,400]
      )
    ]
  )
}

// Section 5: Termination
#let section_termination(number) = {
  v(1cm)
  heading_2([#number. Termination])
  
  v(0.5cm)
  [This Statement of Work may be terminated by either party upon 15 days written notice to the other party. In the event of termination, Client shall pay Turbo Labs for all services performed up to the date of termination, and all non-cancelable expenses incurred in connection with the services.]
  
  v(0.5cm)
}

// Section 6: Background Checks
#let section_background_checks(number) = {
  v(1cm)
  heading_2([#number. Background Checks])
  
  v(0.5cm)
  [Background checks for personnel assigned to this project can be provided upon request.]
  
  v(0.5cm)
}

// Section 7: Additional Provisions (reusing change management, assumptions)
#let section_additional_provisions(number, assumptions, dependencies, contact_name) = {
  v(1cm)
  heading_2([#number. Additional Provisions])
  
  // Assumptions
  v(0.5cm)
  text(weight: "medium")[ASSUMPTIONS:]
  v(0.5em)
  for assumption in assumptions {
    text(weight: "medium")[#assumption.category]
    v(0.5em)
    list(..assumption.items)
    v(0.5em)
  }
  
  // Dependencies
  v(0.5cm)
  text(weight: "medium")[DEPENDENCIES:]
  v(0.5em)
  for dependency in dependencies {
    text(weight: "medium")[#dependency.category]
    v(0.5em)
    list(..dependency.items)
    v(0.5em)
  }
  
  // Change Management
  v(1cm)
  text(weight: "medium")[CHANGE MANAGEMENT:]
  v(0.5em)
  
  text(weight: "medium")[Change Request Process:]
  list(
    [Any changes to the scope, timeline, or budget must be formally requested in writing by either party.],
    [Zac Brooks will amend the milestones and deliverables for the added scope. An updated cost and timeline will be sent to #contact_name for approval.],
    [No work will begin on the added scope until formal written approval is received from #contact_name.]
  )
  
  text(weight: "medium")[Timeline Adjustments:]
  list(
    [Due to the short nature of the project, any approved scope changes will result in corresponding adjustments to the project timeline.],
    [Change requests will be processed and approved promptly to avoid delays in the delivery of milestones.]
  )
  
  text(weight: "medium")[Cost Implications:]
  list(
    [Any additional scope outside of the agreed-upon deliverables will be billed separately and added to the final invoice.]
  )
}

// Section 8: Independent Contractor Status
#let section_independent_contractor(number) = {
  v(1cm)
  heading_2([#number. Independent Contractor Status])
  
  v(0.5cm)
  [Turbo Labs, Inc. is an independent contractor and not an employee of Client. Nothing in this Statement of Work shall be construed as creating an employer-employee relationship, partnership, joint venture, or agency relationship between the parties. Turbo Labs is responsible for all taxes, insurance, and benefits related to its employees.]
  
  v(0.5cm)
}

// Deliverables Table
#let section_deliverables_table(number, deliverables) = {
  v(1cm)
  heading_2([#number. DELIVERABLES & ACCEPTANCE CRITERIA])
  
  grid(
    columns: (100%),
    [
      #block(
        radius: 4pt,
        stroke: rgb("#00000022"),
        width: 100%,
        clip: true,
        [
          #table(
            columns: (1fr, 1fr, 1fr),
            inset: 8pt,
            
            stroke: rgb("#00000022"),
            fill: (col, row) => if col == 0 or row == 0 { rgb("#F0F0F0") },
            
            // Header row
            [#text(weight: "medium")[DELIVERABLE]], 
            [#text(weight: "medium")[DESCRIPTION]], 
            [#text(weight: "medium")[ACCEPTANCE]],
            
            // Data rows
            ..deliverables.map(d => (
              stack(
                spacing: 1em,
                text(weight: "medium")[#d.title],
                stack(
                  dir: ttb,
                  spacing: 0.75em,
                  text(size: 10pt)[#d.milestone]
                )
              ),
              text(size: 10pt)[#d.description],
              text(size: 10pt)[#d.acceptance]
            )).flatten()
          )
        ]
      )
    ]
  )
}

// Approval Section (Signatures)
#let section_approval(number, client_name) = {
  v(1em) // Add some space before the heading
  heading_2([#number. Approval and Signatures])
  v(0.5em) // Space after heading

  [By signing below, both parties agree to the terms outlined in this Statement of Work:]
  v(2em) // More space before the signature blocks

  grid(
    columns: (1fr, 1fr), // Keep two equal columns
    column-gutter: 3em, // Add horizontal space between the columns
    row-gutter: 2em, // Add vertical space between Name/Signature/Date lines
    [ // First Column: Provider (Turbo Labs)
      // Company Name Title
      #text(weight: "medium")[Turbo Labs, Inc.]
     #v(1.5em) // Space before the first line item

      // Name Line Item
      #text(size: 10pt)[Name:] // Label for the line below
      #line(length: 100%, stroke: gray + 0.5pt) // The actual line
   #v(1.5em) // Space before the first line item
      // Signature Line Item
      #text(size: 10pt)[Signature:] // Label for the line below
      #line(length: 100%, stroke: gray + 0.5pt) // The actual line
   #v(1.5em) // Space before the first line item
      // Date Line Item
      #text(size: 10pt)[Date:] // Label for the line below
      #line(length: 100%, stroke: gray + 0.5pt) // The actual line
    ],
    [ // Second Column: Client
      // Client Name Title
      #text(weight: "medium")[#client_name]
      #v(1.5em) // Space before the first line item

      // Name Line Item
      #text(size: 10pt)[Name:] // Label for the line below
      #line(length: 100%, stroke: gray + 0.5pt) // The actual line
   #v(1.5em) // Space before the first line item
      // Signature Line Item
      #text(size: 10pt)[Signature:] // Label for the line below
      #line(length: 100%, stroke: gray + 0.5pt) // The actual line
   #v(1.5em) // Space before the first line item
      // Date Line Item
      #text(size: 10pt)[Date:] // Label for the line below
      #line(length: 100%, stroke: gray + 0.5pt) // The actual line
    ]
  )
  v(2em) // Space after the signature blocks
}

// ===========================================
//          MAIN SOW TEMPLATE FUNCTION
// ===========================================
#let sow(
  
  company_name, 
  company_address_line1,
  company_address_line2,
  contact_person,
  contact_email,
  contact_phone,
  logo_path,
  client_contact1_name,
  client_contact1_title,
  client_contact2_name,
  client_contact2_title,
  sow_detail, 
 title,
subtitle,
  client,
  client_short_name,
  provider,
  project_start,
  project_end,
  created_date, 
  confidentiality_text,

  // Structured content for all sections
  sow_content
) = {

  set document(title: title)
  set text(font: "PP Neue Montreal", size: 11pt)
  set par( leading: 0.75em)
  

  cover_page(
      company_name: company_name,
      company_address_line1: company_address_line1,
      company_address_line2: company_address_line2,
      contact_person: contact_person,
      contact_email: contact_email,
      contact_phone: contact_phone,
      logo_path: logo_path,
      title: title,
      subtitle: subtitle,
      sow_detail: sow_detail,
      client_name: client, // Map sow's 'client' to cover_page's 'client_name'
      client_contact1_name: client_contact1_name,
      client_contact1_title: client_contact1_title,
      client_contact2_name: client_contact2_name,
      client_contact2_title: client_contact2_title,
      created_date: created_date,
      project_start: project_start,
      confidentiality_text: confidentiality_text,
      background_image_path: "../images/cover-image.png"
  )

  set page(
    // Standard margins for the main content pages
    margin: (left: 1.5cm, right: 1.5cm, top: 2.5cm, bottom: 2.5cm),
    number-align: center,
    // Footer definition for main content pages
    footer: [
      #line(length: 100%, stroke: gray)
      #v(0.5em) // Add some space below the line
      #grid(
        columns: (1fr, auto, 1fr), // Center column sized by content
        align(left)[
          #text(size: 8pt)[turbo labs inc. - Confidential]
        ],
        align(center)[
          // Display page number (handled by `numbering` above, but can customize here)
           #context counter(page).display()
        ],
        align(right)[
          #text(size: 8pt)[Statement of Work]
        ]
      )
      #v(0.5em) // Add space below footer text
    ]
  )


    heading_1("Statement of Work")
    space_wrapper([
      #text(size: 10pt, weight: "medium")[PROJECT:]
      #h(0.5em)
      #text(size: 10pt,)[#subtitle]
    ]
    )


  space_wrapper([
    #text(size: 8pt, style: "italic", fill: gray.darken(30%))[This SOW is entered into pursuant to that certain Independent Contractor Services Agreement referenced below (the "Agreement"), by and between #client ("#client_short_name") and #provider ("Turbo Labs"), and the terms and conditions of the Agreement are hereby incorporated by reference.]
  ])


  // Client and provider table with colored background
  block(
    width: 100%,
    fill: rgb("#F0F0F0"), // Light gray background for the first row
    inset: 0pt,
    radius: 0pt,
    {
      set text(size: 10pt)
      table(
        columns: (1fr, 1fr, 1fr, 1fr),
        inset: 10pt,
        align: left,
        stroke: none,

        // Header row
        table.cell(
          fill: rgb("#F0F0F0"),
          [
            #text(weight: "medium")[CLIENT:]
          ]
        ),
        table.cell(
          fill: rgb("#F0F0F0"),
          [
            #text(weight: "medium")[SERVICE PROVIDER]
          ]
        ),
        table.cell(
          fill: rgb("#41142A"), // Reddish background for date headers
          [
            #text(weight: "medium", fill: white)[PROJECT START:]
          ]
        ),
        table.cell(
          fill: rgb("#41142A"), // Reddish background for date headers
          [
            #text(weight: "medium", fill: white)[PROJECT END:]
          ]
        ),
        // Data row
        [#client],
        [#provider],
        table.cell(
          fill: rgb("#41142A"),
          [
            #text(weight: "medium", fill: white)[#project_start]
          ]
        ),
        table.cell(
          fill: rgb("#41142A"),
          [
            #text(weight: "medium", fill: white)[#project_end]
          ]
        )
      )
    }
  )

  // === Render sections based on new Capspire SOW flow ===
  
  // 1. Description of Services (uses the overview section)
  if "overview" in sow_content {
    let overview = sow_content.overview
    section_description_of_services(
      1,
      overview.purpose,
      overview.outcomes
    )
  }
  
  // 2. Work Schedule and Location (new section)
  section_work_schedule_location(2)
  
  // 3. Assigned Personnel (uses the resources table)
  if "pricing" in sow_content {
    let pricing = sow_content.pricing
    section_assigned_personnel(
      3,
      pricing.turbo_resources
    )
  }
  
  // 4. Fees and Expenses (uses the pricing table)
  if "pricing" in sow_content {
    let pricing = sow_content.pricing
    section_fees_and_expenses(
      4,
      pricing.milestone_costs
    )
  }
  
  // 5. Termination (standard section)
  section_termination(5)
  
  // 6. Background Checks (standard section)
  section_background_checks(6)
  
  // 7. Deliverables (if included)
  if "deliverables" in sow_content {
    let deliverables = sow_content.deliverables
    section_deliverables_table(
      7,
      deliverables.deliverables
    )
  }
  
  // 8. Additional Provisions (combines assumptions, dependencies, and change management)
  if "assumptions" in sow_content and "change_management" in sow_content {
    let assumptions = sow_content.assumptions
    let change_management = sow_content.change_management
    section_additional_provisions(
      8,
      assumptions.assumptions,
      assumptions.dependencies,
      change_management.contact_name
    )
  }
  
  // 9. Independent Contractor Status (new section)
  section_independent_contractor(9)
  
  // 10. Approval (signatures section)
  section_approval(10, client)
}