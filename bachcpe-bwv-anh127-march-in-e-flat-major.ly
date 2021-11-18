\version "2.20.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  indent = 0
  %page-breaking = #ly:one-page-breaking
}

\header {
  title = "March in E-flat Major"
  subsubtitle = \markup { "From" \italic "Notebook for Anna Magdalena Bach" "(1725)" }
  composer = \markup {
    \override #'(baseline-skip . 2.5 )
    \right-column {
      "Carl Philipp Emanuel Bach"
      "(spuriously attributed to J. S. Bach)"
    }
  }
  opus = "BWV Anh. 127 (1725)"
  tagline = ##f
}

global = {
  \key ef \major
  \time 2/2
}

upperStaff = {
  \relative c' {
    \repeat volta 2 {
      \partial 4
      ef8 g |
      bf4 c8[ d ef bf] g'4 |
      8 f ef d ef4 <<
        { c4 | c bf2 af4 } \\
        { af4 | af g2 f4 }
      >> |
      \tuplet 3/2 { g8 f ef } ef2 g'4 |
      \tuplet 3/2 { f8 ef d } d[ d] d f ef d | \break
      \tuplet 3/2 { ef8 d c } c[ c] c ef d c |
      \tuplet 3/2 { d ef f } <<
        { f[ 8 8 8] } \\
        { d[ 8 8 8] }
      >> bf' d, |
      \tuplet 3/2 { c d ef } <<
        { ef[ 8 8 8] } \\
        { c[ 8 8 8] }
      >> c' ef, |
      \tuplet 3/2 { d[ bf' a] } \tuplet 3/2 { g[ f ef] } \tuplet 3/2 { d[ c bf] } c4\trill |
      bf2. \break
    }
    \repeat volta 2 {
      bf8 d |
      f4 ef8[ d c bf] af'4 |
      af\trill g2 g,4 |
      \tuplet 3/2 { ef'8[ d c] } \tuplet 3/2 { f[ ef d] } \tuplet 3/2 { g[ f ef] } af c, |
      c4\trill b2 g8 g | \break
      b g d' g, g f f f |
      b g d' f, f[ ef] c'[ ef] |
      g[ c,] \tuplet 3/2 { f ef d } d2\trill |
      c2. ef8 d |
      ef bf g'2 df4 | \break
      df\trill c2 d4 |
      \tuplet 3/2 { ef8[ f g] } \tuplet 3/2 { af[ g f] } \tuplet 3/2 { g[ f ef] } bf' ef, |
      \tuplet 3/2 { d c bf } bf2 af4 |
      \tuplet 3/2 { g8[ af bf] } <<
        { bf[ bf bf bf] } \\
        { g[ g g g] }
      >> ef' g, | \break
      \tuplet 3/2 { f8[ g af] } <<
        { af[ af af af] } \\
        { f[ f f f] }
      >> f' af, |
      \tuplet 3/2 { g8[ af bf] } <<
        { bf[ bf] } \\
        { g[ g] }
      >> g' bf, af g |
      \tuplet 3/2 { f8[ g af] } <<
        { af[ af] } \\
        { f[ f] }
      >> f' af, g f |
      \tuplet 3/2 { g[ ef' d] } \tuplet 3/2 { c[ bf af] } \tuplet 3/2 { g[ f ef] } f4\trill |
      ef2.
    }
  }
}

lowerStaff = {
  \relative c {
    ef4 |
    g af8 f g4 ef |
    bf bf' ef, af |
    bf2 bf, |
    ef4 g8 f g4 ef |
    d bf' bf, bf' |
    f, <<
      { a' a a |
        bf bf bf bf |
        a a a a
      } \\ {
        f f f |
        f f f f |
        f f f f
      }
    >> |
    bf ef, f f, |
    bf f bf,

    %% B section
    bf'4 |
    bf c d bf |
    ef, ef'8 d ef f ef d |
    c4 d ef f |
    g, g'8 fs g4 g, |
    g g g g |
    g g c c |
    ef af g g, |
    c c' bf8 af g f |
    g4 ef8 f g4 ef |
    af, af'8 g af4 f |
    g d ef g |
    bf bf,8 c d4 bf |
    ef ef ef ef, |
    bf' <<
      {
        d d d |
        ef ef8 ef ef4 ef |
        d d d d
      } \\ {
        bf bf bf |
        bf bf bf bf |
        bf bf bf bf
      }
    >> |
    ef af bf bf, |
    ef bf ef,
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
