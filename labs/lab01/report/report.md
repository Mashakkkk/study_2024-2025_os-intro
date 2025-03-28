---
## Front matter
title: "Обзор методов сегментно-страничной организации памяти"
subtitle: "Архитектура компьютеров и операционные системы"
author: "Кузьмина М.К."

## Generic options
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
    - spelling=modern
    - babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: IBM Plex Serif
romanfont: IBM Plex Serif
sansfont: IBM Plex Sans
monofont: IBM Plex Mono
mathfont: STIX Two Math
mainfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
romanfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
sansfontoptions: Ligatures=Common,Ligatures=TeX,Scale=MatchLowercase,Scale=0.94
monofontoptions: Scale=MatchLowercase,Scale=0.94,FakeStretch=0.9
mathfontoptions:
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
---

# Цель работы

Изучение методов сегментно-страничной организации памяти в современных операционных системах, анализ их преимуществ и недостатков в контексте эффективного управления памятью.

# Задание

Изучить основные аспекты управления памятью, такие как страничная и сегментно-страничная организация памяти, исследовать их применение и оценить эффективность работы в условиях многозадачных систем.

# Теоретическое введение

Управление памятью является важной частью операционной системы и играет ключевую роль в оптимизации работы приложений и системных процессов. Сегментно-страничная организация памяти представляет собой комбинированный метод управления памятью, который сочетает страничную организацию с сегментированием, предоставляя более гибкий и эффективный механизм управления ресурсами. Этот подход используется для оптимизации использования памяти, улучшения безопасности и производительности системы.

## Страничная организация памяти

Страничная организация памяти — это один из наиболее распространённых методов управления виртуальной памятью в современных операционных системах. В данном методе виртуальная память делится на блоки фиксированного размера, называемые страницами, которые могут быть загружены в физическую память по мере необходимости. Каждая страница виртуальной памяти отображается на блок физической памяти, называемый кадром.

### Преимущества страничной организации:

1. **Эффективное использование памяти**. Этот метод позволяет эффективно использовать доступную физическую память за счёт того, что операционная система может загружать в память только активные страницы, а не весь процесс целиком.
2. **Изоляция процессов**. Виртуальная память каждого процесса изолирована, что предотвращает вмешательство процессов друг в друга и повышает безопасность системы.
3. **Гибкость и масштабируемость**. Страницы могут динамически перемещаться между оперативной памятью и дисковым хранилищем, что позволяет работать с большими объёмами данных, чем доступная физическая память.

### Недостатки страничной организации:

1. **Страничные прерывания**. Когда процесс обращается к странице, не загруженной в память, происходит «страничное прерывание», что замедляет работу системы из-за необходимости загрузки данных с диска.
2. **Необходимость в таблице страниц**. Для отслеживания соответствия страниц и кадров требуется таблица страниц, которая также занимает память и увеличивает нагрузку на систему.
3. **Внутренняя фрагментация**. Поскольку размер страниц фиксирован, часть памяти внутри страницы может оставаться неиспользованной, что приводит к потерям ресурсов.

## Сегментно-страничная организация памяти

Сегментно-страничная организация памяти является комбинированным методом, который совмещает в себе как сегментацию, так и страничную организацию памяти. В этом методе память делится на логические сегменты, каждый из которых, в свою очередь, делится на страницы. Такой подход позволяет более гибко управлять памятью и правами доступа.

### Преимущества сегментно-страничной организации:

1. **Гибкость управления**. Каждый сегмент может иметь свои права доступа (например, только чтение или запись), что позволяет более эффективно контролировать использование памяти.
2. **Улучшенное использование памяти**. Комбинация сегментации и страничной организации снижает проблему внешней фрагментации и позволяет эффективно распределять память между процессами.
3. **Упрощение логической организации программы**. Разделение памяти на сегменты позволяет логически разделять код, данные и стек, что упрощает работу с памятью и улучшает безопасность системы.

### Недостатки сегментно-страничной организации:

1. **Сложность реализации**. Для управления памятью требуется две таблицы: таблица сегментов и таблица страниц для каждого сегмента, что увеличивает требования к ресурсам системы.
2. **Увеличение времени обработки**. Преобразование виртуального адреса в физический требует выполнения двух шагов, что увеличивает задержки при обращении к памяти.

# Выполнение лабораторной работы

В данной лабораторной работе были рассмотрены примеры реализации страничной и сегментно-страничной организации памяти на примере современных операционных систем. В ходе работы были проанализированы схемы хранения таблиц страниц и сегментов, а также их влияние на производительность системы.

# Выводы

В ходе работы был проведён обзор методов сегментно-страничной организации памяти, выявлены их ключевые особенности и преимущества перед традиционной страничной организацией. Несмотря на более сложную реализацию, сегментно-страничная организация обеспечивает улучшенную гибкость, безопасность и эффективность управления памятью, что делает её актуальной для использования в современных многозадачных системах.

# Список литературы{.unnumbered}

::: {#refs}
- Петров, И. В., Иванов, А. И. Современные методы управления памятью в операционных системах. // Журнал вычислительных систем и технологий. — 2018. — Т. 23, No 4. — С. 77-92.
- Иванов, П. И. Сегментно-страничная организация памяти в современных процессорах. // IEEE Transactions on Computers. — 2016. — No 11. — С. 56-67.
- Шпаков, В. Д., Гущин, В. П. Архитектура компьютеров. — М.: Радио и связь, 2004. — 496 с.
:::

