# NAME

Pod::Weaver::Section::Legal::Supplemented - Add text to the Legal section

![Requires Perl 5.10.1+](https://img.shields.io/badge/perl-5.10.1+-brightgreen.svg) [![Travis status](https://api.travis-ci.org/Csson/p5-Pod-Weaver-Section-Legal-Supplemented.svg?branch=master)](https://travis-ci.org/Csson/p5-Pod-Weaver-Section-Legal-Supplemented)

# VERSION

Version 0.0001, released 2015-11-24.

# SYNOPSIS

    ; in weaver.ini
    [Legal::Supplemented]
    before = This text is rendered before the auto-generated
    before = from [Legal]
    after = And this text comes after
    after =
    after = More text here

# DESCRIPTION

Pod::Weaver::Section::Legal::Supplemented is a sub-class of [Pod::Weaver::Section::Legal](https://metacpan.org/pod/Pod::Weaver::Section::Legal) that gives the possibility to add text before and/or after the auto-generated
text that `[Legal]` renders. Sometimes it might be nice/necessary to mention relationships to companies, trademarks, et cetera used or mentioned. This plugin gives the
opportunity to do that without losing the functionality of `[Legal]` and without having to create another section.

# ATTRIBUTES

This plugin inherits all attributes from [Pod::Weaver::Section::Legal](https://metacpan.org/pod/Pod::Weaver::Section::Legal).

## text\_before

Optional.

The text that should come before the `[Legal]` rendered text. Allowed multiple times.

## text\_after

Optional.

The text that should come after the `[Legal]` rendered text. Allowed multiple times.

# SEE ALSO

- [Pod::Weaver::Section::LegalWithAddendum](https://metacpan.org/pod/Pod::Weaver::Section::LegalWithAddendum) which inspired this

# SOURCE

[https://github.com/Csson/p5-Pod-Weaver-Section-Legal-Supplemented](https://github.com/Csson/p5-Pod-Weaver-Section-Legal-Supplemented)

# HOMEPAGE

[https://metacpan.org/release/Pod-Weaver-Section-Legal-Supplemented](https://metacpan.org/release/Pod-Weaver-Section-Legal-Supplemented)

# AUTHOR

Erik Carlsson <info@code301.com>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by Erik Carlsson.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
