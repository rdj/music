\version "2.24.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  indent = 0
  % markup-system-spacing = #0
  % top-margin = #4
  % bottom-margin = #4
}

\header {
  title = "Waltz in A minor"
  composer = "Frédéric Chopin"
  opus = "Op. posth., B. 150, KK IVb/11, WN 63 (ca. 1843)"
  tagline = ##f
}

\layout {
  \context {
    \Score
    %%\override BarNumber.break-visibility = ##(#t #t #t) % to draw every bar number
    alternativeNumberingStyle = #'numbers-with-letters
    barNumberVisibility = #first-bar-number-invisible-save-broken-bars
  }

  \context {
    \PianoStaff
    \accidentalStyle piano
    printKeyCancellation = ##f
  }
}

global = {
  \key a \minor
  \time 3/4
  \partial 4
  \tempo Allegretto
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This is generally in Rondo form with an 8-bar sections.
%% A A′ |: B :|: A′′ C :| A D

upper = \relative {
  e'4( |
  a8 b c4) c |
  d8( e f2) |
  b,8( c d a' g f) |
  \grace { e16^( f } e8 ds e2) |
  a,8( b c4) c |
  d8( e f2) |
  b,8( c d a' g b, |
  c4) r

  \barNumberCheck #8
  e,4( |
  a8 b c4) c |
  d8( e f2) |
  b,8( c d a' g f) |
  \grace { e16^( f } e8 ds e2) |
  c8( d e4) e |
  f8( g a2) |
  g4(\trill fs8 g d' f, |
  e2.) |

  \section
  \barNumberCheck #17
  \repeat volta 2 {
    e8( fs gs a b c |
    \grace { b16 c } b8 a e b' a4) |
    \grace { a16^( b } a8 gs e f e4) |
    \grace { e16^( f } e8 c a b a4) |
    \tuplet 3/2 { e8( gs b } \tuplet 5/4 { e16 gs b \ottava #1 e gs } b8. c16) |
    \grace { b16^( c } b8 a e b' a4) |
    \grace { a16^( b } a8 gs e e') e4( |
    a,2) \ottava #0 r4 |
  }

  \barNumberCheck #25
  \repeat volta 2 {
    a,,8( b c4) c |
    d8( e f2) |
    b,8( c d a' g f) |
    \grace { e16^( f } e8 ds e2) |
    c8( d e4) e |
    f8( g a2) |
    ds,8( e fs4) fs |
    gs8( a b2) |
    b8( cs d fs e d
    cs\prall b cs gs a fs) |
    \grace { e16^( fs } e8 d gs, fs'! e4) |
    \grace { e16^( fs } e8 cs a fs'! e4) |
    b'8( cs d fs e d |
    cs\prall b cs gs a fs) |
    \grace { e16^( fs } e8 d gs, fs'! e gs, |
    a4) r e |
  }

  \barNumberCheck #41
  a8( b c4) c |
  d8( e f2) |
  b,8( c d a' g f |
  \grace { e16 f } e8 ds e2) |
  a,8( b c4) c |
  d8( e f2) |
  b,8( c d a' g b, |
  c4) r

  \barNumberCheck #48
  e, |
  a8( b c4 c) |
  d8( e f2) |
  r8 e8\prall( ds e b' d, |
  c2) r4 |
  r8 c'8( b a g f |
  e d cs d e f) |
  e4\startTrillSpan( ds8\stopTrillSpan e f gs,) |
  a2 r4 |

  \bar "|."
}

lower = \relative {
  \clef bass
  r4 |
  a,,4 <a'' c e> q |
  d,, <a'' d f> q |
  g, <g' b f'> q |
  c, <g' c e> q |
  a, <a' c e> q |
  d,, <a'' d f> q |
  g, <g' b f'> <g d' f> |
  c, <g' c e>

  \barNumberCheck #8
  r |
  a,,4 <a'' c e> q |
  d,, <a'' d f> q |
  g, <g' b f'> q |
  c, <g' c e> q |
  a, <a' c e> q |
  d,, <a'' d f> q |
  g, <g' b f'> q |
  c, <g' c e> q |

  \section
  \barNumberCheck #17
  \repeat unfold 2 {
    e,4 <e' b' d> <e gs d'> |
    a, <e' a c> q |
    e, <e' b' d> q |
    a, <e' a c> q |
  }

  \barNumberCheck #25
  a,,4 <a'' c e> q |
  d,, <a'' d f> q |
  g, <g' b f'> q |
  c, <g' c e> q |
  a, <a' c e> q |
  d,, <a'' d f> q |
  b,, <a'' b ds> q |
  e, <e' b' d>

  \barNumberCheck #32
  r |
  e, <e' gs d'> q |
  a, <e' a cs> q |
  e, <e' b' d> q |
  a, <e' a cs> q |
  e, <e' gs d'> q |
  a, <e' a cs> q |
  e, <e' b' d> q |
  a, <e' cs'> r |

  \barNumberCheck #41
  a,,4 <a'' c e> q |
  d,, <a'' d f> q |
  g, <g' b f'> q |
  c, <g' c e> q |
  a, <a' c e> q |
  d,, <a'' d f> q |
  g, <g' b f'> <g d' f> |
  c, <g' e'>

  \barNumberCheck #48
  r |
  a,,4 <a'' c e> q |
  d,, <a'' d f> q |
  e, <e' gs d'> q |
  a, <e' a c> q |
  c <e a e'> r |
  d <a' b f'> r |
  e, <e' c'> <e b' d> |
  a, <e' c'> r |
}

%% Note: this is the only editorial mark
editorial.above = {
  s4-\footnote
       ""
       #'(0 . 0)
       \markup \tiny \wordwrap {
         ✱ Musical text from the autograph \italic "Walec" at Bibliothèque Nationale, Paris.
       }
    -""
  |
}

breaks_ref = {
  %% breaks matching some reference for ease of authoring
  s4 |
  s2.*4 |
  \break \barNumberCheck #5
  s2.*6 | \break
  \break \barNumberCheck #11
  s2.*6 |
  \break \barNumberCheck #17
  s2.*5 |
  \break \barNumberCheck #22
  \grace { s16 s }
  s2.*6 |

  \pageBreak \barNumberCheck #28
  \grace { s16 s }
  s2.*6 |
  \break \barNumberCheck #34
  s2.*5 |
  \break \barNumberCheck #39
  \grace { s16 s }
  s2.*6 |
  \break \barNumberCheck #45
  s2.*6 |
  \break \barNumberCheck #51
  s2.*6
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Score

\score {
  \new PianoStaff <<
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #DOWN
    }{
      \global
      \editorial.above
    }
    \new Staff = "up" {
      \global
      \upper
    }
    %% No editorial markings between staves
    \new Staff = "down" {
      \global
      \lower
    }
    %% No editorial markings below the grand staff
    \new Dynamics {
      \global
      \breaks_ref
    }
  >>
}
