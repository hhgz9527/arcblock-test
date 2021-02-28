//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 4 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")
    /// Color `Background-F2F2F2`.
    static let backgroundF2F2F2 = Rswift.ColorResource(bundle: R.hostingBundle, name: "Background-F2F2F2")
    /// Color `Font-333333`.
    static let font333333 = Rswift.ColorResource(bundle: R.hostingBundle, name: "Font-333333")
    /// Color `Font-666666`.
    static let font666666 = Rswift.ColorResource(bundle: R.hostingBundle, name: "Font-666666")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Background-F2F2F2", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func backgroundF2F2F2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.backgroundF2F2F2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Font-333333", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func font333333(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.font333333, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Font-666666", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func font666666(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.font666666, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "Background-F2F2F2", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func backgroundF2F2F2(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.backgroundF2F2F2.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "Font-333333", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func font333333(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.font333333.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "Font-666666", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func font666666(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.font666666.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 1 images.
  struct image {
    /// Image `img-placeholder`.
    static let imgPlaceholder = Rswift.ImageResource(bundle: R.hostingBundle, name: "img-placeholder")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "img-placeholder", bundle: ..., traitCollection: ...)`
    static func imgPlaceholder(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.imgPlaceholder, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = false

      struct uiSceneConfigurations {
        static let _key = "UISceneConfigurations"

        struct uiWindowSceneSessionRoleApplication {
          struct defaultConfiguration {
            static let _key = "Default Configuration"
            static let uiSceneConfigurationName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneConfigurationName") ?? "Default Configuration"
            static let uiSceneDelegateClassName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate"
            static let uiSceneStoryboardFile = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneStoryboardFile") ?? "Main"

            fileprivate init() {}
          }

          fileprivate init() {}
        }

        fileprivate init() {}
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.reuseIdentifier` struct is generated, and contains static references to 5 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `ARCHomeCollectionImageCell`.
    static let arcHomeCollectionImageCell: Rswift.ReuseIdentifier<ARCHomeCollectionImageCell> = Rswift.ReuseIdentifier(identifier: "ARCHomeCollectionImageCell")
    /// Reuse identifier `ARCHomeImageCell`.
    static let arcHomeImageCell: Rswift.ReuseIdentifier<ARCHomeImageCell> = Rswift.ReuseIdentifier(identifier: "ARCHomeImageCell")
    /// Reuse identifier `ARCHomeMultiImageCell`.
    static let arcHomeMultiImageCell: Rswift.ReuseIdentifier<ARCHomeMultiImageCell> = Rswift.ReuseIdentifier(identifier: "ARCHomeMultiImageCell")
    /// Reuse identifier `ARCHomeOneImageCell`.
    static let arcHomeOneImageCell: Rswift.ReuseIdentifier<ARCHomeOneImageCell> = Rswift.ReuseIdentifier(identifier: "ARCHomeOneImageCell")
    /// Reuse identifier `ARCHomeTextCell`.
    static let arcHomeTextCell: Rswift.ReuseIdentifier<ARCHomeTextCell> = Rswift.ReuseIdentifier(identifier: "ARCHomeTextCell")

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.arcString` struct is generated, and contains static references to 1 localization keys.
    struct arcString {
      /// en translation: Home
      ///
      /// Locales: en, zh-Hans
      static let home = Rswift.StringResource(key: "Home", tableName: "ARCString", bundle: R.hostingBundle, locales: ["en", "zh-Hans"], comment: nil)

      /// en translation: Home
      ///
      /// Locales: en, zh-Hans
      static func home(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Home", tableName: "ARCString", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "ARCString", preferredLanguages: preferredLanguages) else {
          return "Home"
        }

        return NSLocalizedString("Home", tableName: "ARCString", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try main.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController

      let arcHomeDetailViewController = StoryboardViewControllerResource<ARCHomeDetailViewController>(identifier: "ARCHomeDetailViewController")
      let arcHomeViewController = StoryboardViewControllerResource<ARCHomeViewController>(identifier: "ARCHomeViewController")
      let bundle = R.hostingBundle
      let name = "Main"

      func arcHomeDetailViewController(_: Void = ()) -> ARCHomeDetailViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: arcHomeDetailViewController)
      }

      func arcHomeViewController(_: Void = ()) -> ARCHomeViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: arcHomeViewController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
          if UIKit.UIColor(named: "Background-F2F2F2", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'Background-F2F2F2' is used in storyboard 'Main', but couldn't be loaded.") }
          if UIKit.UIColor(named: "Font-333333", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'Font-333333' is used in storyboard 'Main', but couldn't be loaded.") }
          if UIKit.UIColor(named: "Font-666666", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'Font-666666' is used in storyboard 'Main', but couldn't be loaded.") }
        }
        if _R.storyboard.main().arcHomeDetailViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'arcHomeDetailViewController' could not be loaded from storyboard 'Main' as 'ARCHomeDetailViewController'.") }
        if _R.storyboard.main().arcHomeViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'arcHomeViewController' could not be loaded from storyboard 'Main' as 'ARCHomeViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
