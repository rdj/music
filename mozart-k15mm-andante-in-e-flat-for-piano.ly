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
  title = "Andante in E-flat for Piano"
  subsubtitle = \markup { "From" \italic "London Sketchbook" "(1765)" }
  composer = "Wolfgang Amadeus Mozart"
  opus = "K. 15mm"
  tagline = ##f
}

\new PianoStaff <<
  \override Score.RehearsalMark.break-visibility = #begin-of-line-invisible %% don't wrap fermata to next line
  \new Staff = "upper" {
    \clef treble
    \key ef \major
    \time 2/4
    \relative c'' {
      \tempo Andante
      \repeat volta 2 {
        bf8. ef16 8 d |
        bf8. f'16 8 ef |
        ef8. df16 c8 af'16 g |
        g f f ef \appoggiatura ef16 d8 c16 bf | \break
        bf8. ef16 8 d |
        bf8. f'16 8 ef |
        ef8. df16 c8 af'16 f |
        f ef ef d ef4 |
      }
      \break
      \repeat volta 2 {
        bf'8( g) bf( f) |
        f8 ef ef d |
        bf' g f f16 g |
        f ef d c bf4 |
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
    \key ef \major
    \time 2/4
    \relative c' {
      <g ef>4 <af f> |
      q <bf g> |
      <g ef'> <af ef'> |
      af8 a bf4 |
      <g ef>4 <af f> |
      q <bf g> |
      <g ef'> <af ef'> |
      bf4 ef, \mark \markup { \musicglyph "scripts.ufermata" } |
      ef' d |
      d8 c c bf |
      ef4 d8 ef |
      f f, bf4_\markup { \translate #'(2 . 0) \small \italic "Da capo" } |
    }
  }
>>
