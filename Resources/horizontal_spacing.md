# Horizontal Spacing

The recommended file format is the [space separated format](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#space-separated-format), which means that spacing between tokens is at least **4 spaces**

TODO ** Difference between Separation and Indentation ** 

## Separation

* **Separator** >= 4 spaces represented by `····` in the following examples. 

```robot
*** Test Cases ***
My Test
    Keyword One····argument1····argument2
```

## Indentation

* **Indentation** n time 4 spaces (where n is the level of indentation and n never exceeds 5, hence nesting depth cannot exceed 4)

Steps in a Keyword

*Example with additional vertical lines for visual clearification: where n == 4 because the keyword also counts in the nesting.*

```
*** Keywords ***
My Nested Keyword
|····FOR    ${i}    IN RANGE    10
|····|····IF    $i % 2
|····|····|····IF   $i > 5
|····|····|····|····Log    Odd number over 5: ${i}
|····|····|····END  |
|····|····END  |    |
|····END  |    |    |
|    |    |    |    |
0    1    2    3    4
```

- Separators in line
  - [v] Separators between Keywords and Arguments
  - [v] Separators between Arguments
  - [v] Separators in Statements (FOR, IF, WHILE)
  - [v] Separators between Variables and Keyword
  - Space between Vars and = ? (and whether to use "=" at all)
- Indentation of Blocks
  - High Level Blocks = Required indention of Keywords within Test Cases

## Line Continuation
[look over there](./line_continuation.md)

## Trailing whitespaces

Trailing whitespaces should be avoided. [Robocop: #trailing-whitespace](https://robocop.readthedocs.io/en/stable/rules.html#trailing-whitespace)

## Prepending whitespaces

Indentations should only be added when needed.

The `*** Settings ***` section should always be left aligned without any indentation [Robocop: #suite-setting-should-be-left-aligned](https://robocop.readthedocs.io/en/stable/rules.html#suite-setting-should-be-left-aligned)

```robot
*** Settings ***
Library      Collections
Resource     data.resource
Variables    vars.robot
```

The `*** Variables ***` secion should always be left aligned without any indentation [Robocop: #variable-should-be-left-aligned](https://robocop.readthedocs.io/en/stable/rules.html#variable-should-be-left-aligned)

```robot
*** Variables ***
${VAR}     my variable
${VAR2}    2
```

## Line Length

A line length of 120 characters is recommended. [Robocop: #line-too-long](https://robocop.readthedocs.io/en/stable/rules.html#line-too-long)

## Spacing in SettingsHeaders

Arguments to settings keywords should be aligned according to the longest keyword added with 4 spaces.

Arguments to libraries should be aligned if there are multiple libraries that have arguments on importing.

```robot
*** Settings ***
Library       String
Library       XML       use_lxml=False
Library       Telnet    timeout=3s    newline=CLRF    encodeing=UTF-8
Resource      ${resourcedir}/mykeywords.resource
Resource      ${resourcedir}/myotherkeywords.resource
Test Tags     mytag
```

## Block Indentation

Blocks like `FOR`, `IF` or `WHILE` should always be indented such that the keywords that are run within the loop have to be indented from the lines that start and end the block. [Robocop: #bad-indent](https://robocop.readthedocs.io/en/stable/rules.html#bad-indent)

(examples from the userguide)

[FOR](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#toc-entry-365)

```robot
*** Test Cases ***
Example
    FOR    ${animal}    IN    cat    dog
        Log    ${animal}
        Log    2nd keyword
    END
    Log    Outside loop

Second Example
    FOR    ${var}    IN    one    two    ${3}    four    ${five}
    ...    kuusi    7    eight    nine    ${last}
        Log    ${var}
    END
```

[WHILE](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#toc-entry-377)

```robot
*** Test Cases ***
Limit as iteration count
    WHILE    True    limit=100
        Log    This is run 100 times.
    END
```

[IF/ELSE](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#toc-entry-384)

```robot
*** Test Cases ***
Example
    IF    $rc > 0
        Positive keyword
    ELSE IF    $rc < 0
        Negative keyword
    ELSE IF    $rc == 0
        Zero keyword
    ELSE
        Fail    Unexpected rc: ${rc}
    END
```

[TRY/EXCEPT](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#toc-entry-389)

```robot
*** Test Cases ***
First example
    TRY
        Some Keyword
    EXCEPT    Error message
        Error Handler Keyword
    END
    Keyword Outside
```

## Comments

In comments there should be a space between the `#` and the actual comment. [Robocop: #missing-space-after-comment](https://robocop.readthedocs.io/en/stable/rules.html#missing-space-after-comment)

Comments should be avoided, write your code readable or use the `[Documentation]`.
Only valid use of comments is for TODO's that should be fixed soon(tm).

If you use comments:
* Comments should be aligned with the block they belong to.
* Inline comments have one indentation before the `#`

```robot
# Comment about Some Keyword here
Some Keyword
    Called Keyword One
    # Comment about Called Keyword Two here
    Called Keyword Two    # TODO fix weird behaviour.
```