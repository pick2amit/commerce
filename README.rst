
Contents

Introduction
Keyword documentation
Installation
Browser drivers
Usage
Extending SeleniumLibrary
Support
Versions
History

Introduction
This is the test automation framework of InstaMojo applicaations used for UI and Integration testing.The framework used here is RobotFramework with the SeleniumLibrary.

Keyword documentation
See keyword documentation for available keywords and more information about the library in general.

Installation
The recommended installation method is using pip:
1-Install the latest Python on your system.
2-Install any IDE, Pycharm recommended.
3-pip install --upgrade robotframework-seleniumlibrary

Running this command installs also the latest Selenium and Robot Framework versions, but you still need to install browser drivers separately. The --upgrade option can be omitted when installing the library for the first time.

Those migrating from Selenium2Library can install SeleniumLibrary so that it is exposed also as Selenium2Library:

pip install --upgrade robotframework-selenium2library
The above command installs the normal SeleniumLibrary as well as a new Selenium2Library version that is just a thin wrapper to SeleniumLibrary. That allows importing Selenium2Library in tests while migrating to SeleniumLibrary.

To install the last legacy Selenium2Library version, use this command instead:

pip install robotframework-selenium2library==1.8.0
With resent versions of pip it is possible to install directly from the GitHub repository. To install latest source from the master branch, use this command:

pip install git+https://github.com/robotframework/SeleniumLibrary.git
Please note that installation will take some time, because pip will clone the SeleniumLibrary project to a temporary directory and then perform the installation.

See Robot Framework installation instructions for detailed information about installing Python and Robot Framework itself. For more details about using pip see its own documentation.


Browser drivers
After installing the library, you still need to install browser and operating system specific browser drivers for all those browsers you want to use in tests. These are the exact same drivers you need to use with Selenium also when not using SeleniumLibrary. More information about drivers can be found from Selenium documentation.

The general approach to install a browser driver is downloading a right driver, such as chromedriver for Chrome, and placing it into a directory that is in PATH. Drivers for different browsers can be found via Selenium documentation or by using your favorite search engine with a search term like selenium chrome browser driver. New browser driver versions are released to support features in new browsers, fix bug, or otherwise, and you need to keep an eye on them to know when to update drivers you use.

Alternatively, you can use a tool called WebdriverManager which can find the latest version or when required, any version of appropriate webdrivers for you and then download and link/copy it into right location. Tool can run on all major operating systems and supports downloading of Chrome, Firefox, Opera & Edge webdrivers.

Here's an example:

pip install webdrivermanager
webdrivermanager firefox chrome --linkpath /usr/local/bin
Usage
To use SeleniumLibrary in Robot Framework tests, the library needs to first be imported using the Library setting as any other library. The library accepts some import time arguments, which are documented in the keyword documentation along with all the keywords provided by the library.

When using Robot Framework, it is generally recommended to write as easy-to-understand tests as possible. The keywords provided by SeleniumLibrary are pretty low level, though, and often require implementation specific arguments like element locators to be passed as arguments. It is thus typically a good idea to write tests using Robot Framework's higher level keywords that utilize SeleniumLibrary keywords internally. This is illustrated by the following example where SeleniumLibrary keywords like Input Text are primarily used by higher level keywords like Input Username.

*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      https://www.instamojo.com
${BROWSER}        Chrome

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    demo
    Input Password    mode
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Login Page

Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}

Submit Credentials
    Click Button    login_button

Welcome Page Should Be Open
    Title Should Be    Welcome Page
The above example is a slightly modified version of an example in a demo project that illustrates using Robot Framework and SeleniumLibrary. See the demo for more examples that you can also execute on your own machine. For more information about Robot Framework test data syntax in general see the Robot Framework User Guide.

Extending SeleniumLibrary
Before creating your own library which extends the SeleniumLibrary, please consider would the extension be also useful also for general usage. If it could be useful also for general usage, please create a new issue describing the enhancement request and even better if the issue is backed up by a pull request.

If the enhancement is not generally useful, example solution is domain specific, then the SeleniumLibrary offers a public API's which can be used to build own plugins and libraries. Plugin API allows to add new keywords, modify existing keywords and modify internal functionality of the library. Also new libraries can be build on top of the SeleniumLibrary. Please see extending documentation for more details about the available methods and for examples how the library can be extended.

Support
If the provided documentation is not enough, there are various support forums available:

robotframework-users mailing list
#seleniumlibrary and #seleniumlibrary-dev channels in Robot Framework Slack community
Robot Framework forum has channel for SeleniumLibrary.
SeleniumLibrary issue tracker for bug reports and concrete enhancement requests
Other support forums including paid support
Versions
SeleniumLibrary has over the years lived under SeleniumLibrary and Selenium2Library names and different library versions have supported different Selenium and Python versions. This is summarized in the table below and the History section afterwards explains the project history a bit more.

Project	Selenium Version	Python Version	Comment
SeleniumLibrary 2.9.2 and earlier	Selenium 1 and 2	Python 2.5-2.7	The original SeleniumLibrary using Selenium RC API.
Selenium2Library 1.8.0 and earlier	Selenium 2 and 3	Python 2.6-2.7	Fork of SeleniumLibrary using Selenium WebDriver API.
SeleniumLibrary 3.0 and 3.1	Selenium 2 and 3	Python 2.7 and 3.3+	Selenium2Library renamed and with Python 3 support and new architecture.
SeleniumLibrary 3.2	Selenium 3	Python 2.7 and 3.4+	Drops Selenium 2 support.
SeleniumLibrary 4.0	Selenium 3	Python 2.7 and 3.4+	Plugin API and support for event friging webdriver.
SeleniumLibrary 4.1	Selenium 3	Python 2.7 and 3.5+	Drops Python 3.4 support.
SeleniumLibrary 4.2	Selenium 3	Python 2.7 and 3.5+	Supports only Selenium 3.141.0 or newer.
SeleniumLibrary 4.4	Selenium 3 and 4	Python 2.7 and 3.6+	New PythonLibCore and dropped Python 3.5 support.
Selenium2Library 3.0	Depends on SeleniumLibrary	Depends on SeleniumLibrary	Thin wrapper for SeleniumLibrary 3.0 to ease transition.
History
SeleniumLibrary originally used the Selenium Remote Controller (RC) API. When Selenium 2 was introduced with the new but backwards incompatible WebDriver API, SeleniumLibrary kept using Selenium RC and separate Selenium2Library using WebDriver was forked. These projects contained mostly the same keywords and in most cases Selenium2Library was a drop-in replacement for SeleniumLibrary.

Over the years development of the old SeleniumLibrary stopped and also the Selenium RC API it used was deprecated. Selenium2Library was developed further and replaced the old library as the de facto web testing library for Robot Framework.

When Selenium 3 was released in 2016, it was otherwise backwards compatible with Selenium 2, but the deprecated Selenium RC API was removed. This had two important effects:

The old SeleniumLibrary could not anymore be used with new Selenium versions. This project was pretty much dead.
Selenium2Library was badly named as it supported Selenium 3 just fine. This project needed a new name.
At the same time when Selenium 3 was released, Selenium2Library was going through larger architecture changes in order to ease future maintenance and to make adding Python 3 support easier. With all these big internal and external changes, it made sense to rename Selenium2Library back to SeleniumLibrary. This decision basically meant following changes:

Create separate repository for the old SeleniumLibrary to preserve its history since Selenium2Library was forked.
Rename Selenium2Library project and the library itself to SeleniumLibrary.
Add new Selenium2Library project to ease transitioning from Selenium2Library to SeleniumLibrary.
Going forward, all new development will happen in the new SeleniumLibrary project.