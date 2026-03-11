# markdown-url.nvim

Automatically convert pasted URLs into Markdown links.

https://example.com

becomes

[Example Domain](https://example.com)

## Requirement 

- curl

## Installation

- lazy.nvim

```
{
  "NineBeans2/markdown-url",
  ft="markdown",
  config = function()
    require("markdown-url").setup()
  end
}

```
