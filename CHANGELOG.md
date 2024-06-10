## [1.11.0] - 10/06/2024

* **Changes**:
    - `layout` attribute is renamed to `textDirection` with `TextDirection` type

## [1.10.1] - 14/04/2024

* **Enhancement**:
    - Add cherry toast image to pubspec package config


## [1.10.0] - 06/04/2024

* **Enhancement**:
    - Add `inheritThemeColors` attribute to enable inherting widget theme of app theme [PR #72](https://github.com/koukibadr/Cherry-Toast/pull/72).

## [1.9.1] - 02/03/2024

* **Enhancement**:
    - Apply dart formatting lint rules for pub analysis.

## [1.9.0] - 28/02/2024

* **Enhancement**:
    - `displayTitle` removed and replaced by the check on the null value of `title` widget.
    - Cherry toast widget should be initialized with either `title` or `description` or both.
    - Refactor toast widget rendering.

## [1.8.0] - 16/01/2024

* **Enhancement**:
    - Add `onToastClosed` callback attribute invoked when the toast get closed or dismissed [Issue #64](https://github.com/koukibadr/Cherry-Toast/issues/64).
## [1.7.0] - 14/01/2024

* **Enhancement**:
    - Update toast position to add center toast display [PR #65](https://github.com/koukibadr/Cherry-Toast/pull/65)
* **Bug Fix**
    - Fix toast position display using `toastPosition` attribute [Issue #62](https://github.com/koukibadr/Cherry-Toast/issues/62)

## [1.6.5] - 13/01/2024

* **Bug Fix**:
    - Fix animation controller timer dispose error [Issue #67](https://github.com/koukibadr/Cherry-Toast/issues/67) [Issue #66](https://github.com/koukibadr/Cherry-Toast/issues/66)


## [1.6.4] - 21/10/2023

* **Enhancements**:
    - Toast animation is now customizable with `disableToastAnimation` attribute

## [1.6.3] - 19/10/2023

* **Enhancements**:
    - Toast animation is now customizable with `disableToastAnimation` attribute

## [1.5.3] - 07/10/2023

* **Enhancements**:
    - Update default toast height
    - Enable toast constraints customization (Add constraints attribute to toast main widget)
    - Update toast rendering callback by removing unnecessary widgets
    - Update toast documentation examples

## [1.4.3] - 27/09/2023

* **Bug fix**: Enable click on screen widgets when toast is open [PR](https://github.com/koukibadr/Cherry-Toast/pull/47)
* **Enhancement**: Add width and height attributes to the toast constructor

## [1.3.3] - 25/09/2023

* Bug fix : Enable to change toast position other than center [Issue 45](https://github.com/koukibadr/Cherry-Toast/issues/45)

## [1.3.2] - 16/09/2023

* Bug fix : Enable click on screen widgets when toast is open [Issue 18](https://github.com/koukibadr/Cherry-Toast/issues/18) [PR 43](https://github.com/koukibadr/Cherry-Toast/pull/43)

## [1.3.1] - 01/07/2023

* Update toast shadow color to support multiple theme color [PR](https://github.com/koukibadr/Cherry-Toast/pull/41)

## [1.2.1] - 30/04/2023

* Fix dismiss issue

## [1.2.0] - 09/04/2023

* Add fromBottom animation ([pull request link](https://github.com/koukibadr/Cherry-Toast/pull/36))
* Change icon widget to any widget type ([pull request link](https://github.com/koukibadr/Cherry-Toast/pull/36))

## [1.1.0] - 21/02/2023

* Add background color parameter

## [1.0.9] - 15/01/2023

* Fix addPostFrameCallback function call in initstate

## [1.0.8] - 06/08/2022

* Fix barrier dimissable issue
* Fix animation and timer dispose error

## [1.0.6] - 02/07/2022

* Fix pub.dev static analysis

## [1.0.5] - 02/07/2022

* Flutter 3 support
* Fix naming conventions
* remove unused variables

## [1.0.4] - 20/04/2022

* Bug fixes

## [1.0.3] - 20/01/2022

* Enhanced widget rendering 
* Bug fixes

## [1.0.2] - 19/08/2021

* Add heartbeat animation on icon
* Customizable icon size and color
* Bug fixes

## [1.0.1] - 24/07/2021

* Add customizable border radius

## [1.0.0] - 20/07/2021

* Add support to all platforms
* Add support to null safety
* Add multiple built-in themes
* Add built-in animations
* Support LTR and RTL layout rendering
* Support Top and Bottom toast display
* Full customization to title, description and action components
