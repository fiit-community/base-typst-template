#import "lib.typ": *

#show: cover-page(
  title: lorem(2),
  subtitle: lorem(3),
  author: (
    name: "Illia Chaban",
    id: 117030,
  ),
  date: datetime.today(),
  year: "2024/2025",
  logo: assets.logo,

  assignment: (
    subject: lorem(1),
    teacher: lorem(2),
    time: "Mon: 10:00",
  ),

  lang: "en",
) 

= Some Header 1

#lorem(60)

== Some Header 2

#lorem(60)


= Some Header 3

#lorem(60)