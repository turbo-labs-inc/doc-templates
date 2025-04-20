#let cover_page(
  // Your Company Info
  company_name: "turbo labs, inc.",
  company_address_line1: "2024 N Freedom Pl",
  company_address_line2: "Fayetteville, AR", // Location hint
  contact_person: "Zac Brooks",
  contact_email: "zac@turbo.inc",
  contact_phone: "501.733.2220",
  logo_path: "turbo-black.png", // <<< REPLACE with your logo path

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
    [#text(weight: "medium")[#company_name] \ #company_address_line1 \ #company_address_line2],
    [#text(weight: "medium")[#contact_person] \ #contact_email \ #contact_phone],
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

#let timeline_table(dates, milestones) = {
  // Create the milestone table in a full-width block
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
            columns: (1fr, ..dates.map(_ => auto)),
            inset: 8pt,
            align: left,
            stroke: (paint: rgb("#00000022"), thickness: 0.5pt),
            
            // Header row with dates - light gray background
            table.cell(
              fill: rgb("#F0F0F0"),
              [#text(weight: "medium")[MILESTONE]]
            ),
            ..dates.map(d => 
              table.cell(
                fill: rgb("#F0F0F0"),
                [#text(weight: "medium")[#d]]
              )
            ),
            
            // Data rows for each milestone
            ..milestones.map(m => (
              [#text(weight: "medium")[#m.title]],
              ..m.schedule.map(s => {
                if s == "1" {
                  table.cell(
                    fill: rgb("#FFEB3B").lighten(50%),
                    align: center,
                    [ ]
                  )
                } else if s == "2" {
                  table.cell(
                    fill: rgb("#4CAF50").lighten(70%),
                    align: center,
                    [ ]
                  )
                } else {
                  table.cell(
                    align: center,
                    [ ]
                  )
                }
              })
            )).flatten()
          )
        ]
      )
    ]
  )
}

#let milestone_description(milestones) = {
  grid(
    columns: (1fr, 1fr),
    gutter: 4em,
    ..milestones.map(m => stack(
      spacing: 1em,
      [#text(weight: "medium")[#m.number: #m.title]],
      [#text(size:10pt)[#m.description_text]],
      
      [#text(weight: "medium", size: 10pt)[APPROVAL: ] #h(0.5em) #text(size: 10pt)[#m.approval_by]],

      [#text(weight: "medium", size: 10pt)[TARGET DATE: ] #h(0.5em) #text(size: 10pt)[#m.target_date]]
    ))
  )
}

#let section_timeline(number, dates: none, milestones) = {
    v(1cm)
  heading_2([#number TIMELINE / MILESTONES])
  

  
  // Use provided dates or fall back to defaults
  let timeline_dates = if dates == none {
    ("1/13", "1/20", "1/27", "2/3", "2/10", "2/17", "2/24", "3/3")
  } else {
    dates
  }
  
  timeline_table(
    timeline_dates,
    milestones
  )
  
  v(2cm)
  
  [Each milestone will be accompanied by a review of all requirements below - through the lens of the following objectives. Approval will be done by product lead on the Gravitate side.]
  
  v(1cm)
  
  milestone_description(milestones)
}

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

#let section_pricing_resources(
  number, 
  resources_needed: (), 
  client_name: "",
  turbo_resources: (),
  client_resources: (),
  milestone_costs: (),
  bonus_percent: none
) = {
  v(1cm)
  heading_2([#number. PRICING + RESOURCES])

  // Resources Needed Callout (only if there are items)
  if resources_needed.len() > 0 {
    block(
      width: 100%,
      fill: rgb("#F0F0F0"),
      inset: 1em,
      radius: 4pt,
      [
        #text(weight: "medium")[Resources Needed]
        #v(0.5em)
        #list(..resources_needed)
      ]
    )
    v(1cm)
  }

  // Resources Tables in 2-column grid
  grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #text(weight: "medium")[TURBO RESOURCES]
      #v(0.5em)
      // Turbo Resources Table
  #block(
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
    ],
    [
      #text(weight: "medium")[#upper(client_name) RESOURCES]
      #v(0.5em)
      // Client Resources Table
      #block(
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
            ..client_resources.map(r => (
              r.role,
              text(weight: "medium")[#r.individual]
            )).flatten()
          )
        ]
      )
    ]
  )

  v(1cm)

  // Milestone Costs Table
  block(
    radius: 4pt,
    stroke: rgb("#00000022"),
    width: 100%,
    clip: true,
    [
      #table(
        columns: (1fr, 1fr),
        inset: 8pt,
        align: (left, right),
        stroke: rgb("#00000022"),
        fill: (col, row) => {
          if row == 0 { rgb("#F0F0F0") }
          else if row == milestone_costs.len() { rgb("#3A3A3A") }
          else if col == 0 { rgb("#F0F0F0") }
        },
        
        // Header row
        [#text(weight: "medium")[MILESTONE]], [#text(weight: "medium")[AMOUNT]],
        
        // Data rows
        ..milestone_costs.map(m => (
          if m.is_total {
            text(fill: white, weight: "medium")[#m.milestone]
          } else {
            text(weight: "medium")[#m.milestone]
          },
          if m.is_total { 
            text(size: 14pt, fill: white, weight: "medium")[\$#str(m.amount)]
          } else {
            text(weight: "regular")[\$#str(m.amount)]
          }
        )).flatten()
      )
    ]
  )

  v(0.5cm)

  // Payment Terms Section
  let total_cost = milestone_costs.filter(m => m.is_total).at(0).amount
  let half_payment = calc.round(total_cost * 0.5, digits: 2)

  heading_4([PAYMENT TERMS], none)
  
  [There will be two invoices sent for this SOW, one to start the project, and then one once all milestones are completed.]
  
  v(1em)
  
  grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,
    [
      Any amended scope will be rolled into the final invoice.
      
      #text(style: "italic")[Due to the accelerated nature of this process, invoices will be sent with a due date of Net 15.]
    ],
    align(right)[
      #stack(
        spacing: 0.5em,
        text(size: 10pt, weight: "medium")[FIRST PAYMENT],
        text(size: 16pt)[\$#str(half_payment)]
      )
    ],
    align(right)[
      #stack(
        spacing: 0.5em,
        text(size: 10pt, weight: "medium")[FINAL PAYMENT],
        text(size: 16pt)[\$#str(half_payment)]
      )
    ]
  )

  v(1cm)
  }
}

#let section_assumptions(number, assumptions: (), dependencies: ()) = {
  v(1cm)
  heading_2([#number. Assumptions & Dependencies])
  
  text(weight: "medium")[ASSUMPTIONS:]
  v(0.5em)
  for assumption in assumptions {
    text(weight: "medium")[#assumption.category]
    v(0.5em)
    list(..assumption.items)
    v(0.5em)
  }
  
 
  text(weight: "medium")[DEPENDENCIES:]
  v(0.5em)
  for dependency in dependencies {
    text(weight: "medium")[#dependency.category]
    v(0.5em)
    list(..dependency.items)
    v(0.5em)
  }
}

#let section_change_management(number, contact_name) = {
  
  heading_2([#number. Change Management])
  
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

#let section_announcements(number) = {
  v(0.5cm)
  heading_2([#number. Public Announcements + Portfolio Use])
  
  heading_4([Portfolio Use:],   [Upon project completion, Turbo Labs, Inc. reserves the right to display the deliverables, including but not limited to design work, in its portfolio, website, and other marketing materials. This is subject to the Client's prior written consent, which shall not be unreasonably withheld.])
  
  
  heading_4([Public Announcements:],   [Both Parties agree not to issue any press releases or public announcements regarding this Agreement or the services provided without the prior written consent of the other Party, except as required by law.])


}

#let section_approval(number, client_name) = {
  v(0.5em)
  heading_2([#number. Approval and Signatures])
  
  [By signing below, both parties agree to the terms outlined in this Statement of Work:]
  
  
  grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #text(weight: "medium")[Turbo Labs, Inc.]
      #v(1cm)
      Name:
      #line(length: 100%, stroke: gray)
      #v(1cm)
      Signature: ___________________
      #v(1cm)
      Date: _______________________
    ],
    [
      #text(weight: "medium")[#client_name]
      #v(1cm)
      Name:
      #line(length: 100%, stroke: gray)
      #v(1cm)
      Signature:
      #line(length: 100%, stroke: gray)
      #v(1cm)
      Date:
    ]
  )
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

#let section_overview(number, purpose, outcomes) = {
  v(1cm)
  heading_2([#number. Project Overview])
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

#let section_scope(number, in_scope_summary, out_of_scope_summary, modules) = {
  v(1cm)
  heading_2([#number. SCOPE OF WORK])
  
  
  
  // IN SCOPE callout
  block(
    width: 100%,
    stroke: rgb("#00000022"),
    inset: 1em,
    radius: 4pt,
    [
      #text(weight: "medium")[IN SCOPE ITEMS]
      #line(length: 100%, stroke: rgb("#00000022"))
 
      #text(size: 10pt)[#in_scope_summary]
    ]
  )
  

  
  // OUT OF SCOPE callout
  block(
    width: 100%,
    stroke: yellow.darken(30%),
    inset: 1em,
    radius: 4pt,
    [
  
      #text(weight: "medium", fill: yellow.darken(30%))[OUT OF SCOPE]
          #line(length: 100%, stroke: yellow.darken(30%))
      
      #text(size: 10pt)[#out_of_scope_summary]
      #v(0.5em)
    ]
  )
  
  v(0.5cm)
  
  // Modules and their features
  for module in modules {
    // Module title (e.g., "1. RATEBOOK")
    heading_3([#module.module_number : #module.title] ,  [#module.description])
    
  
  
    
    // Sections within module
    for section in module.sections {
    
    heading_4([#section.section_number: #section.title] , [#section.description])
      
      // Requirements table
      if "requirements" in section {
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
                  columns: (1in, 1.5in, 1.25in, auto),
                  inset: 8pt,
                  align: left,
                  stroke: rgb("#00000022"),
                  fill: (col, row) => if row == 0 { rgb("#F0F0F0") },
                  
                  // Header row with medium weight
                  [#text(weight: "medium")[ID]], 
                  [#text(weight: "medium")[Feature]], 
                  [#text(weight: "medium")[Type]], 
                  [#text(weight: "medium")[Description]],
                  
                  // Data rows
                  ..section.requirements.map(req => (
                    text(weight: "medium")[#req.id],
                    text(size: 10pt)[#req.feature],
                    text(size: 10pt)[#req.type],
                    text(size: 10pt)[#req.description]
                  )).flatten()
                )
              ]
            )
          ]
        )
      }
      
      v(1cm)
    }
  }
}

#let section_deliverables(number, categories) = {
  heading_1([#number. DELIVERABLES])
  
  for category in categories {
    subsection_heading(category.title)
    for (i, item) in category.items.enumerate() {
      [*#(i + 1). #item.title*]
      list(
        ..item.points
      )
    }
  }
}

// ===========================================
//          EXAMPLE USAGE
// ===========================================
/*
// To use this template, you would call the `sow` function:

#show: sow(
  // Override any default parameters here if needed
  // company_name: "My Company",
  // logo_path: "my_logo.png",
  client: "Example Client Inc.",
  subtitle: "Website Redesign Project",
  // ... other parameters ...

  // Provide the main body content using your section functions
  body: [
    #section_overview(
      1, // Section number
      purpose: [Redesign the client's public-facing website...],
      outcomes: (
        "Modernized look and feel.",
        "Improved mobile responsiveness.",
        "Enhanced user experience.",
      )
    )

    #section_scope(
      2,
      included: (
        (title: "Design", points: ("Wireframes", "Mockups", "Style Guide")),
        (title: "Development", points: ("Frontend coding", "Backend integration")),
      ),
      excluded: (
        "Content creation",
        "SEO optimization",
      )
    )

    // ... Add other sections using your #let functions ...

    #section_approval(
      13, // Example section number
      provider: "Your Company Name Here", // Make sure this matches if needed
      client: "Example Client Inc." // Make sure this matches
    )
  ]
)

*/

/*
Example usage of the timeline section:

#section_timeline(
  2,
  (
    (
      number: "1",
      title: "Wrap Up Initial Designs + Reqs",
      schedule: ("X", "Y", "", "", "", "", "", ""),
      description: [
        + Requirements:Complete design documentation and finalize feature requirements for the freight invoicing system. This includes anything that will be seen to block development.
        
        APPROVAL: Product Lead
        TARGET DATE: January 13, 2024
      ]
    ),
    (
      number: "2",
      title: "Module Prototype",
      schedule: ("", "", "X", "X", "X", "X", "Y", ""),
      description: [
        Deliver working frontend prototype with sample data integration, in Airtable. Focus on user workflows and interaction patterns while validating technical approach. Changes to data will not be persists, but Gravitate can update the data that powers the prototype easily.
        
        APPROVAL: Product Lead + Backend Lead
        TARGET DATE: February 10, 2024
      ]
    ),
    (
      number: "3",
      title: "Shippable Module",
      schedule: ("", "", "", "", "X", "X", "X", "Y"),
      description: [
        Connect frontend to production APIs, implement real data flows, and validate complete system functionality.
        
        APPROVAL: Product Lead
        TARGET DATE: February 24, 2024
      ]
    )
  )
)
*/


// ===========================================
//          MAIN SOW TEMPLATE FUNCTION
// ===========================================
#let sow(
  // Cover Page Specific Info (Add defaults or make required)
  company_name: "Turbo Labs, Inc.", // Default from example
  company_address_line1: "2024 N Freedom Pl",
  company_address_line2: "Fayetteville, AR",
  contact_person: "Zac Brooks",
  contact_email: "zac@turbo.inc",
  contact_phone: "501.733.2220",
  logo_path: "turbo-black.png", // Use the placeholder logo path
  client_contact1_name: "Mike Scharf",
  client_contact1_title: "CEO",
  client_contact2_name: "Bernard Webhe",
  client_contact2_title: "COO",
  sow_detail: "Build a shippable freight invoicing module for Gravitate.", // Example detail

  // Original SOW Info
  title: "Statement of Work",
  subtitle: "Freight Invoicing Module (SOW #3)", // Example subtitle
  client: "Gravitate", // Example client
  client_short_name: "Gravitate",
  provider: "Turbo Labs, Inc.", // Example provider
  project_start: "1.15.2024", // Example date
  project_end: "Project End Date",
  created_date: "1.8.2024", // Example date
  confidentiality_text: "This document and supporting materials contain confidential and proprietary business information of Turbo Labs, Inc. These materials may be printed or photocopied for use in evaluating the proposed project, but are not to be shared with other parties.", //

  // Structured content for all sections
  sow_content: (:) // Expects a dictionary with keys for each section
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
      background_image_path: "cover-image.png"
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
      set text(size: 8pt)
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

  // === Render sections based on sow_content ===
  // Ensure keys exist before trying to access them
  if "overview" in sow_content {
    let overview = sow_content.overview
    section_overview(
      overview.number,
       overview.purpose,
       overview.outcomes
    )
  }
  if "timeline" in sow_content {
    let timeline = sow_content.timeline
    section_timeline(
      timeline.number,
      dates: timeline.dates,
      timeline.milestones
    )
  }
   if "scope" in sow_content {
    let scope = sow_content.scope
    section_scope(
      scope.number,
       scope.in_scope_summary,
       scope.out_of_scope_summary,
       scope.modules
    )
  }
  if "deliverables" in sow_content {
    let deliverables_data = sow_content.deliverables // Use a different variable name to avoid conflict
    section_deliverables_table(
      deliverables_data.number,
      deliverables_data.deliverables // Pass positionally
    )
  }
  if "pricing" in sow_content {
    let pricing = sow_content.pricing
    section_pricing_resources(
      pricing.number,
      resources_needed: pricing.resources_needed,
      client_name: client, // Use main sow parameter passed by name
      turbo_resources: pricing.turbo_resources,
      client_resources: pricing.client_resources,
      milestone_costs: pricing.milestone_costs,
      bonus_percent: pricing.bonus_percent
    )
  }
  if "assumptions" in sow_content {
    let assumptions_data = sow_content.assumptions // Rename variable to avoid conflict
    section_assumptions(
      assumptions_data.number,
      assumptions: assumptions_data.assumptions,
      dependencies: assumptions_data.dependencies
    )
  }
  if "change_management" in sow_content {
    let change_management = sow_content.change_management
    section_change_management(
      change_management.number,
       change_management.contact_name
    )
  }
  if "announcements" in sow_content {
    let announcements = sow_content.announcements
    section_announcements(
        announcements.number
    )
  }
   if "approval" in sow_content {
    let approval = sow_content.approval
    section_approval(
      approval.number,
      client // Use main sow parameter
    )
  }
}


