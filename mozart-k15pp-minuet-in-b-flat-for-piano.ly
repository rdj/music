\version "2.20.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  indent = 0
  page-breaking = #ly:one-page-breaking
}

\header {
  title = "Minuet in B-flat for Piano"
  subsubtitle = \markup { "From" \italic "London Sketchbook" "(1765)" }
  composer = "Wolfgang Amadeus Mozart"
  opus = "K. 15pp"
  tagline = ##f
}

\new PianoStaff <<
  \override Score.RehearsalMark.break-visibility = #begin-of-line-invisible %% don't wrap fermata to next line
  \new Staff = "upper" {
    \clef treble
    \key bf \major
    \time 3/4
    \relative c''' {
      \repeat volta 2 {
        bf4 bf, bf |
        c2 ef8 c |
        bf[ a g f] bf g' |
        f4 ef^\trill d |
        d8\( e\) e\( f\) f4 | \break
        g,8 a a bf bf4 |
        c8 d f,4 e |
        f2 r4 |
      }
      \repeat volta 2 {
        f'4 f, f |
        g2 bf8 g | \break
        f[ e d c] f d' |
        c4 bf^\trill a |
        bf' bf, bf |
        c2 ef8 c |
        bf[ a g f] bf g' | \break
        f4 ef^\trill d |
        g8 a a bf bf4 |
        c,8 d d ef ef4 |
        f8 g bf,4 a |
        \appoggiatura a16 bf2 r4 |
      }
    }
  }

  \new Staff = "lower"
  \with {
    \consists "Mark_engraver" % necessary to render the lower staff fermata
  }
  {
    \override Staff.RehearsalMark.direction = #DOWN
    \override Staff.RehearsalMark.rotation = #'(180 0 0)
    \clef bass
    \key bf \major
    \time 3/4
    \relative c {
      %% A
      d4 d d |
      ef ef ef |
      f ef d |
      c f bf, |
      bf'8 c c d d4 |
      e,8 f f g g4 |
      a8 bf c4 c, |
      f c f, |

      %% B
      a a a |
      bf bf bf |
      c bf a |
      g c f, |
      d' d d |
      ef ef ef |
      f ef d |
      c a' bf |
      ef8 f f g g4 |
      a,8 bf bf c c4 |
      d,8 ef f4 f, |
      bf f' bf |
      \mark \markup { \musicglyph "scripts.ufermata" } |
    }
  }
>>
