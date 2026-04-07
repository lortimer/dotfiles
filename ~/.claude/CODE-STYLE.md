# Code Style Guidelines

## General Style

When writing any code or markdown, follow the style of related or nearby examples when possible and when it doesn't create a bug or security issue.

If you delete all the contents of a file, or at least all the functional content, delete the file.

### Smart Quotes

This company prefers to use Smart Quotes (‘, ’, “, and ”) **within user-facing strings**. These types of quotes are not valid when used in JavaScript, TypeScript, or React files to denote a string. When updating strings that contain smart quotes, ONLY use them **inside** valid strings.

Examples:
- GOOD, the smart apostrophe is used inside a string: `translate('You’ve been invited to Axe DevTools Extension');`
- BAD, The straight single quotes have been replaced by smart apostrophes, probably to match the smart apostrophe in "You've". This is a compiler error: `translate(‘You’ve been invited to Axe DevTools Extension’);`

- GOOD, multiple uses of smart quotes within a string denoted with straight single quotes: `console.log('Why doesn’t “Axe DevTools” show up in Developer Tools?')`
- BAD, the straight single quotes have been replaced by smart apostrophes, probably to match the smart apostrophe in "You've". This is a compiler error: `console.log(‘Why doesn’t “Axe DevTools” show up in Developer Tools?’)`

## Testing
React Testing Library (RTL) is a testing framework meant to help developers test React interfaces for usability and accessibility by interacting with pages in a realistic way. When writing tests using RTL, follow its best practices, which include:
- Prefer to use @testing-library/user-event for user interaction with the page, it is more realistic than `fireEvent`
- Use preferred queries based on the element being tested, see RTL docs for more details and more queries: [RTL Query Priority](https://testing-library.com/docs/queries/about/#priority)
    1. `getByRole` (with the `name` option for any perceptible element) is best for most elements because it can access all elements that are in the accessibility tree. It proves that an element exists, has the right role and affordances, and has the right name
    2. `getByLabelText` is best specifically for inputs like form fields. It proves an element has the right label, but not its role. If using this, it's best to also interact with the element in the test
    3. `getByText` is best for non-interactive text elements, and acceptable to use to prove an element you have tested thoroughly elsewhere is present
    4. `getByAltText` is acceptable for testing images and icons, but `getByRole` is preferred

`getByTestId` should only be used in the following cases:
- when trying to grab a container to query within
- as a last resort when no other query will work, especially when checking for the presence of an element that is tested elsewhere.

When using queries that look for elements by text or name, you can use literal strings or regex.
- Prefer to use complete literal strings when asserting that an element is present, if possible.
- Prefer to use regex when asserting that an element is not present. It may be complete or not, as long as it would uniquely identify the element in question.
