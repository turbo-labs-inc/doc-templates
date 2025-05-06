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
      for sub_item in item {
         render_content_item(sub_item)
      }
  } else {
     repr(item)
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

#let section_understanding_needs(number, data) = {
  heading_2([#number. #data.title])
  // Expect data.needs to be an array of objects
  stack(
    spacing: 3em,
    ..data.needs.map(need => stack(
      spacing: 0.5cm,
      grid(
        columns: (1fr, auto), // Adjusted from original (auto, 1fr) to keep title left
        gutter: 2em,
        // Use heading_3 for title, maybe include ID if provided
        heading_3(need.title, none), 
        // Add vision if provided
        if "vision" in need { align(right)[#v(-0.25em) #text(weight: "medium", size: 10pt)[VISION:] #h(0.5em) #text(size: 10pt)[#need.vision]] } else { [] }
      ),
      line(length: 100%, stroke: gray.lighten(30%)),
      // Add description if provided
      if "description" in need { [#par(text(size: 10pt)[#need.description])] },
      // Add solution_approach if provided
      if "solution_approach" in need { [#text(weight: "medium", size: 10pt)[SOLUTION APPROACH:] #h(0.5em) #text(size: 10pt)[#need.solution_approach]] }
    ))
  )
  v(1cm)
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
      // Directly render the expected paragraph with larger size
      // Assumes data.client_need is (type:"paragraph", text: "...")
      #if type(data.client_need) == dictionary and "type" in data.client_need and data.client_need.type == "paragraph" {
          par(text(size: 12pt)[#data.client_need.text])
      } else {
          // Fallback to default rendering if structure is different
          render_content_item(data.client_need)
      }
    ],
    [
      #text(weight: "medium")[PROPOSED SOLUTION & VALUE]
      #v(0.5em)
      #render_content_item(data.proposed_value)
    ]
  )
  
  v(1cm)
  pagebreak()
}

#let section_proposed_solution(number, data) = {
  heading_2([#number. #data.title])
  if "intro_content" in data {
     render_content_item(data.intro_content)
     v(0.5cm)
  }
  for phase in data.phases {
    heading_3([Phase #phase.number: #phase.title], phase.objective)

    if "goals" in phase and type(phase.goals) == array {
      list(..phase.goals.map(goal =>  goal))
      v(0.5cm)
    }

    if "content" in phase {
       render_content_item(phase.content)
       v(0.5cm)
    }
    if "image_path" in phase {
      align(center)[
        #image(phase.image_path, width: 80%, fit: "contain")
      ]
      v(1cm)
    }
    v(0.75cm)
  }
  v(1cm)
}

#let section_why_us(number, data) = {
  pagebreak()
  heading_2([#number. #data.title])

  // Add intro text if provided
  if "intro_content" in data {
    render_content_item(data.intro_content)
    v(0.5cm)
  }

  // Expect data.points to be an array of objects with 'title' and 'description'
  if "points" in data and type(data.points) == array {
    // Use a grid for card layout (e.g., 2 columns)
    grid(
      columns: (1fr, 1fr), // 2 equal columns
      gutter: 1.5em,      // Spacing between cards
      row-gutter: 1.5em,
      ..data.points.map(point => {
        // Card block styling - similar to tech table blocks
        block(
          width: 100%,
          radius: 4pt,
          stroke: rgb("#00000022"),
          inset: 1em,
          fill: rgb("#FAFAFA"), // Light background for card
          [
            #text(weight: "medium", size: 11pt)[#point.title] // Card title
            #v(0.5em)
            #text(size: 10pt)[#point.description] // Card description
          ]
        )
      })
    )
  }
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
        if "min_price" in p and p.min_price == "TBD" {
          text(weight: "medium")["TBD"]
        } else {
          text(weight: "medium")[\$#p.min_price - \$#p.max_price]
        }
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
  let total_weeks = 20
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
        ..phases.map(p => {
          let start_week = if p.number == 1 { 1 }
                          else if p.number == 2 { 7 } // P2 starts after P1 max duration
                          else { 15 } // P3 starts after P1+P2 max duration

          // Assume p.duration is a number (max weeks), handle 0 duration
          let duration = if "duration" in p and type(p.duration) == int { p.duration } else { 0 }

          // Create row cells
          let cells = range(1, total_weeks + 1).map(w => {
            if duration > 0 and w >= start_week and w < start_week + duration - 1 {
              // In progress weeks (yellow) - Only if duration > 0
              table.cell( fill: rgb("#FFEB3B").lighten(50%), align: center, [ ] )
            } else if duration > 0 and w == start_week + duration - 1 {
               // Delivery week (green) - Only if duration > 0
               table.cell( fill: rgb("#4CAF50").lighten(70%), align: center, [ ] )
            } else {
              // Default empty cell
              table.cell( align: center, [ ] )
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
  if "intro_text" in data {
      render_content_item(data.intro_text)
      v(0.5cm)
  }
  
  timeline_table(data.phases)
  v(1cm)

  // Detailed timeline table - use duration_text for display
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
        [#text(weight: "medium")[DESCRIPTION/OBJECTIVE]],
        [#text(weight: "medium")[DURATION (EST.)]],
        
        // Data rows - use duration_text
        ..data.phases.map(p => (
          text(weight: "medium")[Phase #p.number],
          [#text(weight: "medium")[#p.title] #h(1em) #text(size: 10pt)[#p.objective]],
          text(weight: "medium")[#p.duration_text] // Use the text representation here
        )).flatten()
      )
    ]
  )
  v(1cm)
}

#let section_next_steps(number, data) = {
  pagebreak()
  heading_2([#number. #data.title])
  render_content_item(data.content)
  
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
    summary: section_executive_summary,
    needs: section_understanding_needs,
    solution: section_proposed_solution,
    why_us: section_why_us,
    pricing: section_pricing,
    timeline: section_timeline_overview,
    next_steps: section_next_steps,
  )
  let render_order = ("summary", "needs", "solution", "why_us", "pricing", "timeline", "next_steps")

  for key in render_order {
      if key in sections {
          let section_data = sections.at(key)
          if key in section_render_map {
            let section_function = section_render_map.at(key)
            let number = if "number" in section_data { section_data.number } else { "" }
            let data = if "data" in section_data { section_data.data } else { (:) }
            section_function(number, data)
          }
      }
  }
}


