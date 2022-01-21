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
  title = "Sonata in D minor"
  composer = "Domenico Scarlatti"
  opus = "K 32, L 423"
  tagline = ##f
}

global = {
  \key d \minor
  \time 3/8
}

upperStaff = {
  \tempo "Aria"
  \relative c'' {
    \repeat volta 2 {
      d32[ e f16] e8 d |
      bf' cs, d |
      e32[ f g16] f8 e |
      a gs, a | \break
      cs32[ d e16] d8 cs\trill |
      d a g |
      f16 g f8 e\trill |
      d4. | \break
    }
    \repeat volta 2 {
      a'32[ bf c16] bf8 a |
      bf fs' g |
      g,32[ a bf16] a8 g |
      a e' f | \break
      f,32[ g a16] g8 f |
      e'32[ f g16] f8 e |
      d,32[ e f16] e8 d |
      gs'\trill a4 | \break

      a,32[ bf c16] bf8 a |
      bf cs, d |
      cs'32[ d e16] d8 cs\trill |
      d cs, d | \break
      e'32[ f g16] f8 e |
      a cs,, d |
      e'32[ f g16] d8 cs\trill |
      d4. |
    }
  }
}

lowerStaff = {
  \relative c' {
    <d a d,>4. |
    <d bf g> |
    <e cs a g> |
    <d a f> |
    <cs a g e> |
    <d f,>8 f,, g |
    a4 a8 |
    d,4. |

    <d'' a d,> |
    << <d bf>4. \\ { g,4 f8 } >> |
    << <c' g>4. \\ { e,4 c8 } >> |
    f8 c f, |
    <a' f>4. |
    << { bf8 d cs } \\ { g4 a8 } >> |
    bf4 f8 |
    e a16 g f e |

    <d' a f>4. |
    <bf g> |
    <cs a> |
    << { bf8 a bf } \\ bf,4. >> |
    <a' e cs>4. |
    <a f d>8 e f |
    g a a, |
    d4. |
  }
}

dynamics = {
}

pedalMarks = {
}

\score {
  \new PianoStaff <<
    \new Staff = "upper" {
      \clef treble
      \global
      \upperStaff
    }
    \new Dynamics {
      \global
      \dynamics
    }
    \new Staff = "lower" {
      \clef bass
      \global
      \lowerStaff
    }
    \new Dynamics {
      \global
      \pedalMarks
    }
  >>
}
