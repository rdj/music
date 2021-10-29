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
  title = "Minuet in G minor"
  subsubtitle = \markup { "From" \italic "Notebook for Anna Magdalena Bach" "(1725)" }
  composer = \markup {
    \override #'(baseline-skip . 2.5 )
    \right-column {
      "Christian Petzold"
      "(spuriously attributed to J. S. Bach)"
    }
  }
  opus = "BWV Anh. 115 (1725)"
  tagline = ##f
}

\new PianoStaff <<
  \new Staff = "upper" {
      \clef treble
      \key g \minor
      \time 3/4
      \relative c''' {
        \repeat volta 2 {
          bf4 a g |
          a d, d |
          g g,8 a bf c |
          d2. |
          ef4 f8 ef d c |
          d4 ef8 d c bf |
          c4 d8 c bf c |
          a2.\prall |
          bf'4 a\prall g |
          a d, d |
          g g,8 a bf c |
          d2. |
          f4\mordent g8 f ef d |
          ef4 f8 ef d c |
          d4 g c,\prall |
          <bf f d>2. |
        }
        \repeat volta 2 {
          d4 bf8 c d e |
          f4 g a |
          bf g8 a bf g |
          a4 g8 a f4 |
          f,8 g a bf c d |
          ef4 d c |
          f bf, a |
          bf2. |
          g4 d'8 c d4 |
          g, ef'8 d ef4 |
          g,8 d' fs, c' g bf |
          a2 r4 |
          d,8 e fs g a bf |
          c4 bf a |
          bf8\prall c16 d g,4 fs |
          <g d bf>2. |
        }
      }
  }
  \new Staff = "lower" {
      \clef bass
      \key g \minor
      \time 3/4
      \relative c' {
        %% A
        g2. |
        f |
        ef |
        d4 d'8 c bf a |
        <bf g>2 a4 |
        bf2 g4 |
        a fs g |
        d d'8 c bf a |
        g2. |
        f |
        ef |
        d4 d'8 c b a |
        <b d>2 g4 |
        c a f |
        bf ef, <a f> |
        bf bf,2 |

        %% B
        bf'2. |
        a4 g f |
        g e c |
        f2 r4 |
        a g f |
        g f ef |
        d ef f |
        bf, d' c |
        <d b>2. |
        c2. |
        bf4 a g |
        d' a8 g fs e |
        d2 r4 |
        ef d c |
        bf c d |
        g g,2 |
      }
  }
>>
