[Figma](https://www.figma.com/design/HiWJTSkFbkV44hcnJxYebU/Product-Design?node-id=2018-769)

## basic framework

- allow for design to be changed entirely using skins / themes
- skins can be downloaded and installed via a simple store
- for a skin to be made, we need to define the design system so it can be customised

## skins

Skins are defined by JSON files using the format in
[`assets/skins/komorebi.json`](../assets/skins/komorebi.json). The
`AppSkin` model in `lib/src/design_system/skins/app_skin.dart` parses the
definition and builds both Material and Cupertino themes. New skins can keep
the same fields while providing different colors:

```json
{
  "name": "My skin",
  "colorScheme": {
    "brightness": "light",
    "primary": "#FF0000",
    "onPrimary": "#FFFFFFFF",
    "primaryContainer": "#FFFFDBCC",
    "onPrimaryContainer": "#FF3A0B00",
    "secondary": "#FF77574A",
    "onSecondary": "#FFFFFFFF"
  },
  "semanticColors": {
    "neutral": "#FFFFFFFF",
    "informational": "#FFBBDEFB",
    "destructive": "#FFFFCDD2",
    "success": "#FFC8E6C9"
  },
  "availableImages": [
    {
      "id": "collection-floral-1",
      "assetPath": "assets/skins/images/1.png",
      "format": "png",
      "description": "Botanical flower visual guide."
    }
  ]
}
```

`availableImages` catalogs visual guides that a skin can use for collection
artwork. Each entry has a stable `id`, an asset path, a `format` (`svg`, `png`,
or `jpeg`), and a description.

## design ideas that are never going to be used

- liquid glass
- shadows
- blurs
- gradients (unless used inside skins and icons etc)

## design resources

https://freedesignstuff.com/
https://phosphoricons.com/

for skins

https://publicdomainreview.org/explore/
https://pdimagearchive.org/images/e6cc917e-e04c-4229-a879-0e72963934f2/
https://openverse.org/ doesn't work much but want to try again

this one is specially good
Familiar Indian Flowers
https://archive.org/details/india.history.resource.93692/page/n11/mode/2up
