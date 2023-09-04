\version "2.24.0"
\language "english"
\pointAndClickOff

%% Chopin uses regular and long >-shaped accent marks. The longer ones
%% I render with modified hairpins. See my comments in the source for
%% Waltz WN 47 [Op. posth. 69, No. 1] for more details.

long_accent_base = {
  \once \override Hairpin.endpoint-alignments = #'(-1 . -1)
  \once \override Hairpin.thickness = 2.0
  \once \override Hairpin.height = 0.4
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
}

long_accent_below = {
  \long_accent_base
  \once \override Hairpin.self-alignment-Y = -1
}

long_accent_above = {
  \long_accent_base
  \once \override Hairpin.self-alignment-Y = 1
}

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  % markup-system-spacing = #0
  % top-margin = #4
  % bottom-margin = #4
}

\header {
  title = "Prelude in D-flat major"
  subsubtitle = \markup { "No. 15 from" \italic "24 Préludes pour le Piano" "(1839)" }
  composer = "Frédéric Chopin"
  opus = "Op. 28, No. 15"
  tagline = ##f
}

\layout {
  \context {
    \Score

    %% Pedal marks by default have zero width, allowing, them to
    %% horizontally overlap. This restores their natural width so that
    %% \sustainOff can be arbitrarily close to \sustainOn but not run
    %% into it.
    \override SustainPedal.extra-spacing-width = #'(0 . 0)

    \omit TupletBracket
  }
  \context {
    \PianoStaff
    \consists "Span_stem_engraver"
    \accidentalStyle piano
    printKeyCancellation = ##f
  }
}

global = {
  \tempo Sostenuto
  \key df \major
  \time 4/4
}

upper_first_theme = \relative {
  f''8.\( df16 af2 bf4 |
  c2. df4 ef8. f16 gf2 f4 |
  f4. ef8 df4
}

upper_B_soprano = \absolute {
  s1*7 |
  \once \hide NoteHead
  \repeat unfold 40 { gs'8 } |
  \repeat unfold 3 \repeat unfold 8 <b b'>8 |

  s1 |

  \barNumberCheck #44

  s1*7 |
  \once \hide NoteHead
  \repeat unfold 40 { gs'8 } |
  \repeat unfold 3 \repeat unfold 8 <b b'>8 |

  \barNumberCheck #59

  <b ds' gs' b'>8
  \repeat unfold 7 gs'8 |
}

upper_B_alto = \relative {
  \relative {
    s1*7 |
    s1 |
    s2 cs'4 bs |
    s2 ds4 cs4~ |
    4 ds e ds |
    ds1 |
    <e gs>2 <ds gs>2 |
    <e gs>2 <ds gs>2 |
    <gs ds>2 <fss ds>2 |
  }

  s1 |

  \barNumberCheck #44

  \relative {
    s1*7 |
    s1 |
    s2 cs'4 bs |
    s2 ds4 cs4~ |
    4 ds e ds |
    ds1 |
    <e gs>2 <ds gs>2 |
    <e gs>2 <ds gs>2 |
    <gs ds>2 <fss ds>2 |
  }
}

lower_B_soprano = \absolute {
  \repeat unfold 7 {
    \repeat unfold 8 { gs8 } |
  }
  \autoBeamOff
  \crossStaff \repeat unfold 40 { gs8 }
  \autoBeamOn
  s1*3 |

  \change Staff = "up"
  <b ds' gs' b'>8
  \change Staff = "down"
  \repeat unfold 7 gs8 |

  \barNumberCheck #44

  %% All but the last measure repeats
  \repeat unfold 7 {
    \repeat unfold 8 { gs8 } |
  }
  \autoBeamOff
  \crossStaff \repeat unfold 40 { gs8 }
  \autoBeamOn
  s1*3 |
}

upper_C_soprano = {
  \barNumberCheck #60
}

upper_C_alto = {
  \barNumberCheck #60
}

upper = \relative {
  \clef treble

  \voiceOne
  \upper_first_theme
  \relative {
    \grace ef''8 \tuplet 7/2 { ef8_( f ef d ef f gf)\) } |
  }
  \upper_first_theme \)

  \oneVoice
  \relative {
    c''8
    -\shape #'(() ((0 . 2) (0 . 2) (1 . 1) (0.5 . 0))) \(
    df |
    ef4 2 f4 |
    gf8 f ef df f2 |
    ef8 cf bf af bf4 \grace { cf8 bf af } bf8. cf16 |
    \once \stemDown af4\)
  }

  \relative {
    ef''4
    -\shape #'(() ((0 . 2) (0 . 2) (1 . 1) (0.5 . 0))) \(
    df ff |
    ef4 2 f4 |
    gf8 f ef df f2~ |
    8 df c bf c4 \grace { df8 c bf } c df |
    bf4\)
  }

  \relative  {
    f''4\( ef gf |
    f8 df c bf c4 \grace { df8 c bf } c8. df16 |
    bf4 ef f ef |
    f2. ef4\)
  }

  \voiceOne
  \upper_first_theme
  \tuplet 7/2 \relative { d''8 ef e f af g gf\) } |
  \relative {
    f''8.\( df16 af2 bf4 |
    c2. df4 ef8. f16 gf2\) c,4( |
    ef2)
  }

  \oneVoice
  r2 |

  \barNumberCheck #28
  \key cs \minor

  <<
    \new Voice = "soprano" {
      \voiceOne
      \upper_B_soprano
    }
    \new Voice = "alto" {
      \voiceTwo
      \override Voice.NoteColumn.force-hshift = -0.5
      \upper_B_alto
    }
    \new Voice = "soprano-down" {
      \voiceThree
      \change Staff = "down"
      \lower_B_soprano
    }
  >>

<<
  \new Voice = "soprano" {
    \voiceOne
    \upper_C_soprano
  }
  \new Voice = "alto" {
    \voiceTwo
    \upper_C_alto
  }
>>
}

lower = \relative {
  \clef bass
  s1*27 |
  \barNumberCheck #28
  \key cs \minor
  s1*48 |
  \barNumberCheck #76
  \key df \major
  s1*14
}

above = {
}

between = {
}

below = {
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% breaks_ref to match NE

breaks_ref = {
  s1*3 | \break
  \barNumberCheck #4
  s1*4 | \break
  \barNumberCheck #8
  s1*4 | \break
  \barNumberCheck #12
  s1*4 | \break
  \barNumberCheck #16
  s1*4 | \pageBreak

  \barNumberCheck #20
  s1*4 | \break
  \barNumberCheck #24
  s1*4 | \break
  \barNumberCheck #28
  s1*5 | \break
  \barNumberCheck #33
  s1*5 | \break
  \barNumberCheck #38
  s1*4 | \break
  \barNumberCheck #42
  s1*5 | \pageBreak

  \barNumberCheck #47
  s1*5 | \break
  \barNumberCheck #52
  s1*4 | \break
  \barNumberCheck #56
  s1*4 | \break
  \barNumberCheck #60
  s1*4 | \break
  \barNumberCheck #64
  s1*4 | \pageBreak

  \barNumberCheck #68
  s1*4 | \break
  \barNumberCheck #72
  s1*4 | \break
  \barNumberCheck #76
  s1*4 | \break
  \barNumberCheck #80
  s1*5 | \break
  \barNumberCheck #85
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Score

\score {
  \new PianoStaff <<
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #DOWN
    }{
      \global
      \above
    }
    \new Staff = "up" {
      \global
      \upper
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    }{
      \global
      \between
    }
    \new Staff = "down" {
      \global
      \lower
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #UP
    }{
      \global
      \below
    }
    \new Dynamics {
      \global
      \breaks_ref
    }
  >>
}
