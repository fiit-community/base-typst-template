
#let localization = yaml("localization.yaml")

// TODO: Fix this
#let get_localization(lang) = {
  if lang == "en" {
    return localization.en
  } else if lang == "sk" {
    return localization.sk
  } else {
    return localization.en
  }
}
