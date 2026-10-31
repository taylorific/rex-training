---
theme: seriph
# random image from a curated Unsplash collection by Anthony
# like them? see https://unsplash.com/collections/94734566/slidev
background: https://cover.sli.dev
hideInToc: true
title: "Ghostty Training"
author: "Mischa Taylor"
info: |
  ## Ghostty Training
  A fast, native, GPU-accelerated terminal with tabs and splits built in.
# apply unocss classes to the current slide
class: text-center
# https://sli.dev/features/drawing
drawings:
  persist: false
# enable MDC Syntax: https://sli.dev/features/mdc
mdc: true
themeConfig:
  paginationX: r
  paginationY: t
  paginationPagesDisabled: [1]
---

# Ghostty Training

##### Mischa Taylor | 📧 <taylor@linux.com>

<div @click="$slidev.nav.next" class="mt-12 py-1" hover:bg="white op-10">
  Press Space for next page <carbon:arrow-right />
</div>

---
hideInToc: true
routeAlias: toc
---

# Table of Contents

<Toc columns="2"/>

---
src: ./ghostty/ghostty-slides.md
---
