\version "2.20.0"
\language "english"
\pointAndClickOff

\paper {
  indent = 0
  page-breaking = #ly:one-page-breaking
}

\layout {
  ragged-last = ##t
}

\header {
  title = "Prelude in C"
  subsubtitle = \markup { "From " \italic "Fünf kleine Präludien" }
  composer = "Johann Sebastian Bach"
  opus = "BWV 939 (ca. 1720)"
  tagline = ##f
}

%% I'd prefer to use define-event-function, then this could go after
%% the note like \mordent usually does, but I can't figure out how
%% to do the script-priority override in an event function, it has
%% to come before the note.
msharp = #(define-music-function (note) (ly:music?)
           #{
           \once \override TextScript.script-priority = #-100
           #note
           ^ \markup {\teeny \sharp}
           \mordent
           #} )

\new PianoStaff <<
  \new Staff = "upper" {
    \clef treble
    \key c \major
    \time 4/4
    \relative c' {
      r8 c e g e c bf' g |
      a c, f a f c c' a |
      b g b d b g f' d |
      <e c g>2 r4 <e c g> |
      <d c a>2 r4 <d c a> |
      <d b g>8 g, b d <b g>4 <e b> |
      c2 r4 <c a e>~ |
      8 c, fs a fs d c' a |
      b g b d b g f'? d |
      e g, c e c g g' e |
      fs a, c fs c a a' fs |
      <g d b>2 r4 b, |
      c8 e g c g e bf' g |
      a16 g f e d c b a b g a b c d e f |
      g4 <c, g>2 <b d,>4 |
      <c e,>1
      \bar "|."
    }
  }

  \new Staff = "lower" {
    \clef bass
    \key c \major
    <<
      \relative c {
        <c c,>1~ |
        1~ |
        1  |
        r8 c e g e c c' e, |
        fs d fs a fs d d' fs, |
        g2 r4 g |
        a8 a, c e c a g' e |
        fs2 r4 d |
        \repeat unfold 3 {
          \repeat unfold 2 {
            \msharp g
            g,
          }
        }
        g'8 g, b d b g f' d |
        e c e g e c c' e, |
        f1~ |
        8 d e c g'4 g, |
        c,1
      }
    >>
  }
>>
