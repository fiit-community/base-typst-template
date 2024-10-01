
#import "localization.typ": get_localization as _get_loc

// zero vertical space
#let _zv() = v(0pt)

#let cover-page(
  title: none,
  subtitle: none,
  author: (
    name: none,
    id: none,
  ),
  date: none,
  year: none,
  logo: none,

  assignment: (
    subject: none,
    teacher: none,
    time: none,
  ),

  lang: "sk",
  font: "New Computer Modern",
) = body => {
  let _loc = _get_loc(lang)

  // Defaults
  let title = if title != none {title} else {text(red)[Write a title]}
  let subtitle = if subtitle != none {subtitle} else {text(red)[Write a subtitle]}

  let author = author
  // document-author is used in the header
  author.insert("document-author", if author.name != none {author.name} else {"Write a name"})
  author.name = if author.name != none {author.name} else {text(red)[Write a name]}
  author.id = if author.id != none {author.id} else {text(red)[Write an ID]}


  let assignment = assignment
  assignment.subject = if assignment.subject != none {assignment.subject} else {text(red)[Write a subject]}
  assignment.teacher = if assignment.teacher != none {assignment.teacher} else {text(red)[Write a teacher]}
  assignment.time = if assignment.time != none {assignment.time} else {text(red)[Write a time]}

  let date = if date != none {date} else {datetime.today()}
  let logo = if logo != none {logo} else {(width: none) => {text(red, size: 5em)[No logo]}}
  let year = if year != none {year} else {text(red)[Write an academic year]}
  // End of defaults

  set document(
    author: author.document-author,
    title: title,
    date: date,
  )
  set page(numbering: "1", number-align: right)
  set text(font: font, lang: lang)
  set heading(numbering: "1.1")
  set par(leading: 0.58em)
  set align(center)

  show par: set block(above: 0.75em, below: 0.75em)

  text(1.2em, weight: "bold", _loc.fiit); _zv()
  text(1.2em, _loc.stu)
  
  v(1fr)
  align(center, logo(width: 20%))
  v(1fr)

  text(1.8em, weight: 700, title); _zv()
  text(1.6em, subtitle)

  v(1fr)
  
  align(
    center,
    grid(
      columns: 2,
      align: left,
      gutter: 8em,
      text[
        *#_loc.cover-page.author-name:* #author.name \
        *#_loc.cover-page.author-id*: #author.id \
      ],
      text[
        *#_loc.cover-page.subject:* #assignment.subject \
        *#_loc.cover-page.teacher:* #assignment.teacher \
        *#_loc.cover-page.time:* #assignment.time \
      ]
    )
  )

  v(1fr)
  text(1.2em, [*#_loc.cover-page.academic-year:* #year])
  
  pagebreak()

  set page(
    header: [
      #set text(8pt)
      #smallcaps[#author.name]
      #h(1fr)
      #smallcaps[#title]
    ]
  )

  set par(justify: true)
  set align(start)
  set align(alignment.top)
  
  outline(
    title: _loc.content.title,
  )
  pagebreak()

  body
}
