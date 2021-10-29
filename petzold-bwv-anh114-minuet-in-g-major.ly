\version "2.20.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
  indent = 0
}

\header {
  title = "Minuet in G major"
  subsubtitle = \markup { "From" \italic "Notebook for Anna Magdalena Bach" "(1725)" }
  composer = \markup {
    \override #'(baseline-skip . 2.5 )
    \right-column {
      "Christian Petzold"
      "(spuriously attributed to J. S. Bach)"
    }
  }
  opus = "BWV Anh. 114 (1725)"
  tagline = ##f
}

\new PianoStaff <<
  \new Staff = "upper" {
      \clef treble
      \key g \major
      \time 3/4
      \relative c'' {
        \repeat volta 2 {
          d4 g,8 a b c |
          d4 g, g |
          e'4 c8\mordent d e fs |
          g4 g, g |
          c\mordent d8 c b a |
          b4 c8 b a g |
          fs4 g8 a b g |
          \appoggiatura b8 a2. |
          d4 g,8 a b c |
          d4 g, g |
          e'4 c8\mordent d e fs |
          g4 g, g |
          c\mordent d8 c b a |
          b4 c8 b a g |
          a4 b8 a g fs |
          g2.
        }
        \repeat volta 2 {
          b'4 g8 a b g |
          a4 d,8 e fs d |
          g4 e8 fs g d |
          cs4 b8 cs a4 |
          a8 b cs d e fs |
          g4 fs e |
          fs a, cs |
          d2. |
          d4 g,8 fs g4 |
          e'4 g,8 fs g4 |
          d' c b |
          a8 g fs g a4 |
          d,8 e fs g a b |
          c4 b\prall a |
          b8 d g,4 fs |
          <g d b>2.
        }
      }
  }
  \new Staff = "lower" {
      \clef bass
      \key g \major
      \time 3/4
      \relative c' {
        %% A
        <g b d>2 a4 |
        b2. |
        c |
        b |
        a |
        g |
        d'4 b g |
        d' d,8 c' b a |
        b2 a4 |
        g b g |
        c2. |
        b4 c8 b a g |
        a2 fs4 |
        g2 b4 |
        c d d, |
        g2 g,4 |

        %% B
        g'2. |
        fs |
        e4 g e |
        a2 a,4 |
        a'2. |
        b4 d cs |
        d fs, a |
        d d, c'? |
        <<
          { r4 d2 | r4 e2 }\\
          { b2 b4 | c2 c4 }
        >> |
        b a g |
        d'2 r4 |
        <<
          { r4 r4 fs,4 } \\
          { d2. }
        >> |
        e4 g fs |
        g b, d |
        g d g, |
      }
  }
>>
