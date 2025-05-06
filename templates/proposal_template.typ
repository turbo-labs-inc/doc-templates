#let cover_page(
  company_name,
  company_address_line1,
  company_address_line2,
  contact_person,
  contact_email,
  contact_phone,
  logo_path,
  title,
  subtitle,
  proposal_detail,
  client_name,
  client_contact1_name,
  client_contact1_title,
  client_contact2_name,
  client_contact2_title,
  created_date,
  project_start_est,
  confidentiality_text,

) = {
  set page(
    margin: (top: 1in, bottom: 0pt, x: 0pt),
    numbering: none,
    footer: none,
  )

  grid(
    inset: (x: 0.5in),
    columns: (1fr, 1fr, auto),
    gutter: 1em,
    [#text(weight: "medium")[#company_name] \ #company_address_line1 \ #company_address_line2],
    [#text(weight: "medium")[#contact_person] \ #contact_email \ #contact_phone],
    align(right)[#image(logo_path, width: 6cm)]
  )

  v(2fr)

  block(inset: (left: 1in, right: 0.5in))[
    #grid(
      inset: (x: 0.25in),
      columns: (auto, 1fr),
      column-gutter: 1em,
      align(top, rect(width: 2pt, height: 4cm, fill: black)),
      stack(
        spacing: 1.5em,
        text(size: 48pt)[#title],
        v(1cm),
        text(size: 18pt, weight: "medium")[#subtitle],
        text(size: 12pt)[#proposal_detail]
      )
    )
  ]

  v(1fr)


    align(center)[
      #image( "../images/cover-image.png", width: 80%, height: 8cm, fit: "contain")
    ]
  

  block(
    width: 100%,
    fill: rgb("#3A3A3A"),
    inset: (x: 2em, top: 1.5em, bottom: 1.5em),
    radius: 0pt,
    above: 0pt,
    [
      #set text(fill: white)
      #grid(
        columns: (3fr, 1fr),
        column-gutter: 2em,

        stack(
          dir: ttb, spacing: 3em,
          stack(dir: ttb, spacing: 0.5cm,
            text(size: 1.1em)[Prepared For:],
            text(size: 2.2em, weight: "medium")[#client_name]
          ),
          grid(
            columns: (1fr, if client_contact2_name != none {1fr} else {0fr}),
            rows: (auto), column-gutter: 2em,
            [#text(weight: "medium")[#client_contact1_name] \ #client_contact1_title],
            if client_contact2_name != none { [#text(weight: "medium")[#client_contact2_name] \ #client_contact2_title] } else { [] }
          )
        ),

        align(top + right,
          stack(dir: ttb, spacing: 4em,
            stack(dir: ttb, spacing: 0.75em,
              text(size: 1.1em)[Created:],
              text(size: 1.1em, weight: "medium")[#created_date]
            ),
            stack(dir: ttb, spacing: 0.75em,
              text(size: 1.1em)[Project Start Est.:],
              text(size: 1.1em, weight: "medium")[#project_start_est]
            )
          )
        )
      )

      #v(2.5em)
      #line(length: 100%, stroke: white.darken(40%))
      #v(1em)
      #text(size: 9pt, style: "italic")[
        #text(weight: "medium")[Statement of Confidentiality] #h(0.5em)
        #confidentiality_text
      ]
    ]
  )
}

#let format-currency(amount) = {
    let rounded = calc.round(float(amount), digits: 2)
    let text = repr(rounded)
    if not "." in text { text += ".00" }
    else if text.split(".").at(1).len() == 1 { text += "0" }
    "$" + text
}


#let space_wrapper(content) = { block(above: 0.5cm, below: 0.5cm)[#content] }
#let heading_1(content) = { space_wrapper(text(size: 24pt, weight: "medium")[#content]) }
#let heading_2(content) = {
  v(0.5cm)
  space_wrapper(text(size: 18pt)[#content])
  v(0.25cm)
  line(length: 100%, stroke: gray.lighten(30%))
  v(0.5cm)
}
#let heading_3(content, description) = {
  v(0.25cm)
  space_wrapper(text(size: 14pt, weight: "medium")[#content])
  if description != none and type(description)=="string" {
    block(inset: (left: 1em), text(size: 10pt)[#description])
    v(0.25cm)
  } else if description != none {
     block(inset: (left: 1em))[#render_content_item(description)]
     v(0.25cm)
  }
}
#let heading_4(content, description) = {
  v(0.25cm)
  space_wrapper(text(size: 11pt, weight: "medium")[#upper(content)])
   if description != none and type(description)=="string" {
    block(inset: (left: 1em), text(size: 10pt)[#description])
    v(0.25cm)
  } else if description != none {
     block(inset: (left: 1em))[#render_content_item(description)]
     v(0.25cm)
  }
}
#let subsection_heading(content) = {
  set text(weight: "medium", size: 12pt)
  v(0.5cm)
  [#content]
  v(0.2cm)
}

#let render_paragraph(data) = {
  par[#data.text]
}

#let render_strong_paragraph(data) = {
  par[#strong(data.text)]
}

#let render_list(data) = {
  list(..data.items)
}

#let render_content_item(item) = {
  if type(item) == dictionary and "type" in item {
    if item.type == "paragraph" {
      render_paragraph(item)
    } else if item.type == "list" {
      render_list(item)
    } else if item.type == "strong_paragraph" {
      render_strong_paragraph(item)
    } else if item.type == "callout" {
      v(1em)
      block(
        width: 100%,
        inset: (x: 1.5em, y: 1.5em),
        fill: rgb("#FAFAFA"),
        radius: 4pt,
        stroke: (left: 4pt + rgb("#3A3A3A")),
        [
          #text(weight: "medium", size: 11pt)[#item.title]
          #v(0.75em)
          #text(size: 9pt)[#item.content]
        ]
      )
      v(1em)
    } else { repr(item) }
  } else if type(item) == "string" {
      item
  } else if type(item) == array {
      render_mixed_content(item)
  } else {
     repr(item)
  }
}

#let render_mixed_content(content_array) = {
  for item in content_array {
    render_content_item(item)
  }
}

#let render_tech_table(table_data) = {
  for group in table_data.groups {
    block(
      width: 100%,
      inset: (x: 0pt, y: 0.5em),
      {
        // Group header
        v(1em)
        text(weight: "medium", size: 14pt)[#group.name]
        v(0.25em)
        text(size: 10pt)[#group.description]
        v(0.5em)
        
        // Components in 2-column grid
        block(
          radius: 4pt,
          stroke: rgb("#00000022"),
          width: 100%,
          clip: true,
          [
            #table(
              columns: (1fr, 1fr),
              inset: 12pt,
              align: left,
              stroke: rgb("#00000022"),
              fill: rgb("#00000005"),
              
              // Create rows with two cells each
              ..group.components.map(comp => {
                stack(
                  spacing: 0pt,
                  text(weight: "medium")[#comp.name],
                  v(0.5cm),
                  block(spacing: 0.65em)[#text(size: 10pt)[#comp.description]]
                )
              }).flatten()
            )
          ]
        )
      }
    )
    v(1em)
  }
}

#let section_technology_approach(number, data) = {
  heading_2([#number. #data.title])
  for item in data.content {
    if item.type == "paragraph" {
      render_paragraph(item)
      v(0.5cm)
    } else if item.type == "tech_table" {
      render_tech_table(item)
    } else {
      render_content_item(item)
    }
  }
  v(1cm)
}

#let render_roi_section(label, value, note: none, is_total: false, is_highlight: false) = {
  grid(
    columns: (1fr, auto),
    gutter: 1em,
    [#text(size: 10pt)[#label]],
    stack(
      spacing: 0.25em,
      align(right)[
        #if is_total {
          text(size: 16pt, weight: "medium")[#value]
        } else if is_highlight {
          text(size: 14pt, weight: "medium", fill: rgb("#4CAF50"))[#value]
        } else {
          text(weight: "medium")[#value]
        }
      ],
      if note != none { 
        align(right)[
          #text(size: 9pt, fill: gray.darken(20%))[#note]
        ]
      }
    )
  )
}

#let render_roi_block(title, items) = {
  // Header outside the table
  text(weight: "medium", size: 14pt)[#title]
  v(0.75em)
  
  // Table with white background and grey borders
  block(
    width: 100%,
    inset: 0pt,
    radius: 4pt,
    stroke: rgb("#00000022"),
    [
      #stack(
        spacing: 0pt,
        ..items.filter(item => not "is_total" in item and not "is_highlight" in item).map(item => {
          block(
            width: 100%,
            fill: white,
            inset: 1em,
            stroke: (bottom: 0.5pt + rgb("#00000022")),
            render_roi_section(
              item.label,
              item.value,
              note: if "note" in item { item.note } else { none },
            )
          )
        }),
        // Footer with totals and highlights
        ..items.filter(item => "is_total" in item or "is_highlight" in item).map(item => {
          block(
            width: 100%,
            fill: rgb("#F9F9F9"),
            inset: 1em,
            render_roi_section(
              item.label,
              item.value,
              note: if "note" in item { item.note } else { none },
              is_total: if "is_total" in item { item.is_total } else { false },
              is_highlight: if "is_highlight" in item { item.is_highlight } else { false },
            )
          )
        })
      )
    ]
  )
  v(2em)
}

#let section_executive_summary(number, data) = {
  v(1cm)
  heading_2([#number. #data.title])
  v(1cm)
  grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #text(weight: "medium")[CLIENT NEED / OPPORTUNITY]
      #v(0.5em)
      #render_content_item(data.client_need)
    ],
    [
      #text(weight: "medium")[PROPOSED SOLUTION & VALUE]
      #v(0.5em)
      #render_mixed_content(data.proposed_value)
    ]
  )
  
  v(1cm)
  heading_2(data.impact_statement.title)
  align(center)[
    #block(
      width: 100%,
      inset: (x: 0em, y: 1em),
      [
        #text(size: 32pt)[#data.impact_statement.text]
      ]
    )
  ]
  pagebreak()
  
  // ROI Analysis Section
  heading_2("Return on Investment Analysis")
  v(1cm)
  
  stack(
    spacing: 0em,
    render_roi_block("Business Assumptions", data.roi_analysis.current_economics),
    render_roi_block("AI-Enhanced Process", data.roi_analysis.enhanced_economics),
    
    // Capacity Impact section
    text(weight: "medium", size: 18pt)[Capacity Impact],
    v(2em),
    
    // Time Saved subsection
    text(weight: "medium", size: 12pt)[Time Savings Breakdown],
    v(0.5cm),
    block(
      width: 100%,
      inset: 0pt,
      radius: 4pt,
      stroke: rgb("#00000022"),
      [
        #stack(
          spacing: 0pt,
          ..data.roi_analysis.capacity_impact.time_saved.filter(item => not "is_total" in item).map(item => {
            block(
              width: 100%,
              fill: white,
              inset: 1em,
              stroke: (bottom: 0.5pt + rgb("#00000022")),
              render_roi_section(item.label, item.value, note: if "note" in item { item.note } else { none },)
            )
          }),
          ..data.roi_analysis.capacity_impact.time_saved.filter(item => "is_total" in item).map(item => {
            block(
              width: 100%,
              fill: rgb("#F9F9F9"),
              inset: 1em,
              render_roi_section(
                item.label, 
                item.value, 
                note: if "note" in item { item.note } else { none },
                is_total: true,
              )
            )
          })
        )
      ]
    ),
    v(1.5em),
    
    // Revenue Impact subsection
    text(weight: "medium", size: 12pt)[Additional Revenue Potential],
    v(0.5cm),
    block(
      width: 100%,
      inset: 0pt,
      radius: 4pt,
      stroke: rgb("#00000022"),
      [
        #stack(
          spacing: 0pt,
          ..data.roi_analysis.capacity_impact.revenue_impact.filter(item => not "is_total" in item).map(item => {
            block(
              width: 100%,
              fill: white,
              inset: 1em,
              stroke: (bottom: 0.5pt + rgb("#00000022")),
              render_roi_section(item.label, item.value, note: if "note" in item { item.note } else { none },)
            )
          }),
          ..data.roi_analysis.capacity_impact.revenue_impact.filter(item => "is_total" in item).map(item => {
            block(
              width: 100%,
              fill: rgb("#F9F9F9"),
              inset: 1em,
              render_roi_section(
                item.label, 
                item.value, 
                note: if "note" in item { item.note } else { none },
                is_total: true,
              )
            )
          })
        )
      ]
    ),
    v(2em),
    
    render_roi_block("Total Annual Impact", data.roi_analysis.total_impact),
    
    // Intangible Benefits section
    text(weight: "medium", size: 14pt)[Intangible Benefits: Beyond the Numbers],
    v(0.75cm),
    block(
      width: 100%,
      fill: white,
      stroke: rgb("#00000022"),
      inset: 1.5em,
      radius: 4pt,
      [
        #text(size: 10pt)[#data.roi_analysis.intangible_benefits_intro]
        #v(0.75em)
        #text(weight: "medium")[Key intangible benefits include:]
        #list(..data.roi_analysis.intangible_benefits)
        
        #if "custom_section" in data.roi_analysis {
          v(1.5em)
          text(weight: "medium", size: 11pt)[#data.roi_analysis.custom_section.title]
          v(0.75em)
          text(size: 10pt)[#data.roi_analysis.custom_section.content]
        }
      ]
    )
  )
  v(1cm)
}

#let section_understanding_needs(number, data) = {
  heading_2([#number. #data.title])
  stack(
    spacing: 3em,
    ..data.needs.map(need => stack(
      spacing: 0.5cm,
      grid(
        columns: (auto, 1fr),
        gutter: 2em,
        heading_3([#need.id.replace("N", ""): #need.title], none),
        align(right)[#v(0.75em) #text(weight: "medium", size: 10pt)[VISION:] #h(0.5em) #text(size: 10pt)[#need.vision]]
      ),
      line(length: 100%, stroke: gray.lighten(30%)),
      [#par(text(size: 10pt)[#need.description])],
      [#text(weight: "medium", size: 10pt)[SOLUTION APPROACH:] #h(0.5em) #text(size: 10pt)[#need.solution_approach]]
    ))
  )
  v(1cm)
}

#let section_proposed_solution(number, data) = {
  heading_2([#number. #data.title])
  if "intro_content" in data {
     render_content_item(data.intro_content)
     v(0.5cm)
  }
  for phase in data.phases {

    
    if "image_path" in phase {
      align(center)[
        #image(phase.image_path, width: 100%, fit: "contain")
      ]
      v(1cm)
    }
    heading_3([Phase #phase.number: #phase.title], phase.objective)
    
    if "features" in phase {
      subsection_heading("Key Features & Activities")
      block(
        radius: 4pt,
        stroke: rgb("#00000022"),
        width: 100%,
        clip: true,
        [
          #table(
            columns: (1fr, 2fr),
            inset: 8pt,
            align: left,
            stroke: rgb("#00000022"),
            fill: (col, row) => if row == 0 { rgb("#F0F0F0") },
            
            // Header row
            [#text(weight: "medium")[FEATURE]], [#text(weight: "medium")[DESCRIPTION]],
            
            // Data rows
            ..phase.features.map(feature => {
              let (title, description) = if feature.contains(":") {
                let parts = feature.split(":")
                (parts.at(0), parts.slice(1).join(":").trim())
              } else {
                (feature, none)
              }
              (
                text(weight: "medium")[#title],
                if description != none { text(size: 10pt)[#description] } else { text(size: 10pt)[#feature] }
              )
            }).flatten()
          )
        ]
      )
    }
    
    if "deliverables" in phase {
      v(0.75cm)
      subsection_heading("Key Deliverables")
      block(
        radius: 4pt,
        stroke: rgb("#00000022"),
        width: 100%,
        clip: true,
        [
          #table(
            columns: (1fr, 2fr),
            inset: 8pt,
            align: left,
            stroke: rgb("#00000022"),
            fill: (col, row) => if row == 0 { rgb("#F0F0F0") },
            
            // Header row
            [#text(weight: "medium")[DELIVERABLE]], [#text(weight: "medium")[DESCRIPTION]],
            
            // Data rows
            ..phase.deliverables.map(deliverable => {
              let (title, description) = if deliverable.contains(":") {
                let parts = deliverable.split(":")
                (parts.at(0), parts.slice(1).join(":").trim())
              } else {
                (deliverable, none)
              }
              (
                text(weight: "medium")[#title],
                if description != none { text(size: 10pt)[#description] } else { text(size: 10pt)[#deliverable] }
              )
            }).flatten()
          )
        ]
      )
    }
    v(0.75cm)
  }
  v(1cm)
}

#let section_security_privacy(number, data) = {
  heading_2([#number. #data.title])
  render_mixed_content(data.content)
  v(1cm)
}

#let section_project_management_collaboration(number, data) = {
  heading_2([#number. #data.title])
  render_mixed_content(data.content)
  v(1cm)
}

#let section_why_us(number, data) = {
  heading_2([#number. #data.title])
  render_mixed_content(data.content)
  v(1cm)
}

#let section_pricing(number, data) = {
  heading_2([#number. #data.title])
  render_content_item(data.intro_text)
  v(0.5cm)
  block(radius: 4pt, stroke: rgb("#00000022"), width: 100%, clip: true)[
    #table(
      columns: (2fr, 1fr), inset: 8pt, align: (left, right), stroke: rgb("#00000022"),
      fill: (col, row) => if row == 0 { rgb("#F0F0F0") } else if col == 0 { rgb("#F9F9F9") },
      [#text(weight: "medium")[PHASE]], [#text(weight: "medium")[ESTIMATED PRICE RANGE]],
      ..data.phase_costs.map(p => (
        text(weight: "medium")[Phase #p.number: #p.title],
        text(weight: "medium")[\$#p.min_price - \$#p.max_price]
      )).flatten(),
    )
  ]
  v(1cm)
  subsection_heading("Pricing Assumptions & Exclusions")
  if "assumptions_text" in data and data.assumptions_text != none { render_content_item(data.assumptions_text); v(0.5em) }
  if "exclusions" in data { text(weight: "medium")[Excludes:]; list(..data.exclusions) }
  v(1cm)
}

#let timeline_table(phases) = {
  // Calculate total weeks (assuming max duration for visualization)
  let total_weeks = 20 // This covers our full timeline

  // Create week headers
  let week_headers = range(1, total_weeks + 1).map(w => [#w])

  block(
    radius: 4pt,
    stroke: rgb("#00000022"),
    width: 100%,
    clip: true,
    [
      #table(
        columns: (3in, ..week_headers.map(_ => auto)),
        inset: 8pt,
        align: (left, ..week_headers.map(_ => center)),
        stroke: rgb("#00000022"),
        
        // Header row with week numbers
        table.cell(
          fill: rgb("#F0F0F0"),
          [#text(weight: "medium")[PHASE]]
        ),
        ..week_headers.map(w => 
          table.cell(
            fill: rgb("#F0F0F0"),
            align: center,
            [#text(size: 8pt, weight: "medium")[#w]]
          )
        ),
        
        // Phase rows with colored cells for duration
        ..phases.map(p => {
          let start_week = if p.number == 1 { 1 }
                          else if p.number == 2 { 7 }
                          else { 15 }
          let duration = if p.number == 1 { 6 }
                        else if p.number == 2 { 8 }
                        else { 6 }
          
          // Create row cells
          let cells = range(1, total_weeks + 1).map(w => {
            if w >= start_week and w < start_week + duration - 1 {
              // In progress weeks (yellow)
              table.cell(
                fill: rgb("#FFEB3B").lighten(50%),
                align: center,
                [ ]
              )
            } else if w == start_week + duration - 1 {
              // Delivery week (green)
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
          
          // Return row with phase title and duration cells
          ([#text(weight: "medium")[Phase #p.number: #p.title]], ..cells)
        }).flatten()
      )
    ]
  )
}

#let section_timeline_overview(number, data) = {
  heading_2([#number. #data.title])
  render_content_item(data.intro_text)
  v(0.5cm)
  
  // Gantt-style timeline visualization
  timeline_table(data.phases)
  
  v(1cm)
  
  // Detailed timeline table
  block(
    radius: 4pt,
    stroke: rgb("#00000022"),
    width: 100%,
    clip: true,
    [
      #table(
        columns: (auto, 1fr, auto),
        inset: 8pt,
        align: left,
        stroke: rgb("#00000022"),
        fill: (col, row) => if row == 0 { rgb("#F0F0F0") },
        
        // Header row
        [#text(weight: "medium")[PHASE]], 
        [#text(weight: "medium")[DESCRIPTION]], 
        [#text(weight: "medium")[DURATION]],
        
        // Data rows
        ..data.phases.map(p => (
          text(weight: "medium")[Phase #p.number],
          [#text(weight: "medium")[#p.title] \ #text(size: 10pt)[#p.description_text]],
          text(weight: "medium")[#p.duration]
        )).flatten()
      )
    ]
  )
  
  
}

#let section_next_steps(number, data) = {
  pagebreak()
  heading_2([#number. #data.title])
  render_mixed_content(data.content)
  
}


#let proposal(
  company_name, company_address_line1, company_address_line2,
  contact_person, contact_email, contact_phone, logo_path,
  client_name, client_contact1_name, client_contact1_title,
  client_contact2_name, client_contact2_title,
  proposal_title, proposal_subtitle, proposal_detail,
  created_date, project_start_est, confidentiality_text,
  content_data
) = {

  set document(title: proposal_title)
  set text(font: ("PP Neue Montreal", "Arial"), size: 11pt)
  set par(leading: 0.75em, first-line-indent: 0pt, justify: false)
  set list(indent: 1.5em)

  cover_page(
      company_name, company_address_line1, company_address_line2,
      contact_person, contact_email, contact_phone, logo_path,
      proposal_title,
      proposal_subtitle,
      proposal_detail,
      client_name, client_contact1_name, client_contact1_title,
      client_contact2_name, client_contact2_title,
      created_date, project_start_est, confidentiality_text, 
  )

  set page(
    margin: (x: 1.75cm, y: 2.5cm),
    number-align: center, numbering: "1",
    footer: [
      #line(length: 100%, stroke: gray.lighten(30%)); 
      #v(0.75em)
      #grid(
        columns: (1fr, auto, 1fr),
        align(left)[#text(size: 8pt)[#company_name - Confidential]],
        align(center)[
          #context[
          #here().page()
          ]],
        align(right)[#text(size: 8pt)[Proposal: #proposal_subtitle]]

      ); 
          #v(0.5em)
      
    ]
  )

  let sections = content_data

  let section_render_map = (
    summary: section_executive_summary, needs: section_understanding_needs,
    solution: section_proposed_solution, tech: section_technology_approach,
    security: section_security_privacy, management: section_project_management_collaboration,
    why_us: section_why_us, pricing: section_pricing,
    timeline: section_timeline_overview, next_steps: section_next_steps,
  )
  let render_order = ("summary", "needs", "solution", "tech", "security", "management", "why_us", "pricing", "timeline", "next_steps")

  for key in render_order {
      if key in sections {
          let section_data = sections.at(key)
          let section_function = section_render_map.at(key)
          section_function(section_data.number, section_data.data)
      }
  }
}


