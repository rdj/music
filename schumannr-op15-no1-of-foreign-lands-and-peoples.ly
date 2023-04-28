\version "2.24.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  indent = 0
  ragged-right = ##f
}

\header {
  title = "Von fremden Ländern und Menschen"
  subtitle = "“Of Foreign Lands and Peoples”"
  subsubtitle = \markup { "From" \italic "Kinderszenen “Scenes from Childhood”" "(1839)" }
  composer = "Robert Schumann"
  opus = "Op. 15, No. 1 (1838)"
  tagline = ##f
}

\layout {
  \context {
    \PianoStaff
    \accidentalStyle piano
    %% \override TupletBracket.bracket-visibility = ##t
    \override StaffGrouper.staff-staff-spacing = #'(
      (basic-distance . 11)
      (padding . 0)
    )
    \override Fingering.avoid-slur = #'inside
  }
}

global = {
  \key g \major
  \time 2/4
  \tempo \markup \medium {
    M. M.
    \rhythm { 4 s } = 108
  }
}

trip = #(define-music-function (music) (ly:music?) #{ \tuplet 3/2 #music #})
up = #(define-music-function (music) (ly:music?) #{ \change Staff = "up" \once \stemDown #music \change Staff = "down" #})


upper.A = \relative {
  b'4(^2 g' |
  fs8.-\finger \markup \overtie "4 5" e16 d4) |
  b4(^2 g' |
  fs8. e16 d4) |
  b4(^2 g' |
  e8.-\finger \markup \overtie "4 5" d16 c4 |
  a d |
  b2) |
}

lower.A_tenor = \relative {
  \repeat unfold 2 {
    \trip { b8 d \up g  } \trip { bf, e \up g  } |
    \omit TupletNumber
    \trip { a, d \up fs } \trip { c   d \up a' } |
  }
  \trip { b, d  \up g    } \trip { g,  d' \up g  } |
  \trip { g, e' \up g    } \trip { g,  c  \up g' } |
  \trip { g, c  \up g'   } \trip { fs, c' \up fs } |
  \trip { d, b' \up g'^1 } \trip { g,  b  \up g' } |
}

lower.A_bass = \relative {
  g8_2_3 r cs, r |
  d r fs r |
  g r cs, r |
  d r fs r |
  g r
  <<
    { \stemDown g4_~ | 4 } \\
    { \once \override NoteColumn.force-hshift = #0.5 b,8 r | \once \override NoteColumn.force-hshift = #0.5 c r }
  >>
  e r |
  d r d r |
  g, r g' r |
}

lower.A = {
  \clef bass
  <<
    \new Voice = "tenor" {
      \voiceOne
      \lower.A_tenor
    }
    \new Voice = "bass" {
      \voiceTwo
      \lower.A_bass
    }
  >>
}

upper.B = \relative {
  <b'^4 g>4( <c a> |
  <a^4 fs> <b g>) |
  <g^4 e>( <a e> |
  <fs ds> <g d>) |
  e^2( fs |
  g8.^\finger \markup \overtie "4 3" a16 b8. _\finger \markup \overtie "5 3" ^\fermata c16) |
}

lower.B_tenor = \absolute {
  \omit TupletNumber
  \trip { e8 b  \up e' } \trip { a,  a  \up e' } |
  \trip { d  a  \up d' } \trip { b,  g  \up d' } |
  \trip { c  g  \up c' } \trip { fs, fs \up c' } |
  \trip { b, fs \up b  } \trip { g,  g  \up b  } |
  \trip { c  g  \up c' } \trip { d   a  \up d' } |
  \trip { d  g  \up d' } \trip { g,  a  \up d' } |
}

lower.B_bass = \relative {
  e4_2( a, |
  \once \mergeDifferentlyDottedOn
  d8._3 c16 b4) |
  c_2( fs, |
  \once \mergeDifferentlyDottedOn
  b8. a16 g4) |
  \voices 2,4,6 %% three downstem voices
  <<
    \relative { s2 | s4 \once \omit TupletBracket \once \omit TupletNumber \trip { s8 a4 } } \\
    \relative { s2 | d2 } \\
    \relative {
      c4( c |
      b8._2_3 a16 g4)_\fermata
    }
  >> |
}

lower.B = \relative {
  <<
    \new Voice = "tenor" {
      \voiceOne
      \lower.B_tenor
    }
    \new Voice = "bass" {
      \voiceTwo
      \lower.B_bass
    }
  >>
}

upper.A′ = \relative {
  d''4(^3 g |
  fs8. e16 d4) |
  b4( g' |
  fs8. e16 d4) |
  b4(^2 g' |
  e8. d16 c4 |
  a d |
  b2) |
}

lower.A′_tenor = \relative {
  \omit TupletNumber
  \repeat unfold 2 {
    \trip { b8 d \up g  } \trip { bf, e \up g  } |
    \trip { a, d \up fs } \trip { c   d \up a' } |
  }
  \trip { b, d  \up g  } \trip { g,  d' \up g  } |
  \trip { g, e' \up g  } \trip { g,  c  \up g' } |
  \trip { g, c  \up g' } \trip { fs, c' \up fs } |
  \trip { d, b' \up g' } \trip { b,  b  \up g' } |
}

lower.A′_bass = \relative {
  g8_2_3 r cs, r |
  d r fs r |
  g r cs, r |
  d r fs r |
  g r
  <<
    { \stemDown g4_~ | 4 } \\
    { \once \override NoteColumn.force-hshift = #0.5 b,8 r | \once \override NoteColumn.force-hshift = #0.5 c r }
  >>
  e r |
  d r d r |
  \voices 2,4 <<
    \absolute {
      \omit TupletNumber
      \omit TupletBracket
      \trip { s8 b4~ } \trip { \once \hideNotes 4 s8 }
    } \\
    \once \mergeDifferentlyHeadedOn
    <d g,>2
  >> |
}

lower.A′ = {
  <<
    \new Voice = "tenor" {
      \voiceOne
      \lower.A′_tenor
    }
    \new Voice = "bass" {
      \voiceTwo
      \lower.A′_bass
    }
  >>
}

editorial.above = {
  s2*11 |
  s4 s4^\markup \italic { ritard. } |
  \override TextSpanner.bound-details.left.text = \markup { \italic "ritard." }
  \override TextSpanner.bound-details.left-broken.text = ""
  \trip { s8 s8\startTextSpan s8 } s4 |
  s4 s8\stopTextSpan s8 |
}

editorial.between = {
  s4-\tweak extra-offset #'(0 . 2) \p s4 | s2*5 |
  s4 \tuplet 3/2 { s8
                   \once \override Hairpin.self-alignment-Y = -3
                   \once \override Hairpin.endpoint-alignments = #'(0 . -1)
                   \once \override Hairpin.shorten-pair = #'(0.5 . 0.5)
                   s8\> s8 } |
  s4 \tuplet 3/2 { s8 s8 s8\! } |
  s4-\tweak extra-offset #'(0 . 2) \p s4 |
  s2*3 |
  \trip { s8 s8
          \once \override Hairpin.self-alignment-Y = -3
          \once \override Hairpin.endpoint-alignments = #'(0 . -1)
          %\once \override Hairpin.shorten-pair = #'(0 . 1)
          s8\< } s4 |
  s4 \trip { s8 s8 s8\! } |
  s4-\tweak extra-offset #'(0 . 3) \p s4 |
  s2*4 |
  \trip { s8
          \once \override Hairpin.self-alignment-Y = -3
          \once \override Hairpin.endpoint-alignments = #'(-1 . -1)
          s8\> s8 } s4 |
  s2 |
  s4 \trip { s8 s8 s8\! } |
}

editorial.below = {
  s4\sustainOn
}

breaks_ref = {
  %% breaks matching some reference for ease of authoring
  s2*4 \break
  \barNumberCheck #5
  s2*4 \break
  \barNumberCheck #9
  s2*5 \break
  \barNumberCheck #14
  s2*4 \break
  \barNumberCheck #18
  s2*5
}

%%showLastLength =   % use this to only render the last few measures
\score {
  \new PianoStaff <<
    \new Dynamics {
      \global
      \editorial.above
    }
    \new Staff = "up" {
      \global
      \clef treble
      \voiceOne
      \repeat volta 2 {
        \upper.A
      }
      \repeat volta 2 {
        \upper.B
        \upper.A′
      }
    }
    \new Dynamics {
      \global
      \editorial.between
    }
    \new Staff = "down" {
      \global
      \lower.A
      \lower.B
      \lower.A′
    }
    \new Dynamics {
      \global
      \editorial.below
    }
    \new Dynamics {
      \global
      \breaks_ref
    }
  >>
}
