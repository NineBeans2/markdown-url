# markdown-url

A nvim plugin that automatically convert pasted URLs into Markdown links. 

`https://example.com`

will be pasted to

`[Example Domain](https://example.com)`

## Requirement 

- curl

## Installation

- lazy.nvim

```
{
  "NineBeans2/markdown-url",
  ft="markdown",
  config = function()
    require("markdown-url").setup(
    --        {keymap = "p"}
            )
  end
}

```
