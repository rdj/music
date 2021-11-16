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
  title = "Valse Noble"
  subsubtitle = \markup { "From" \italic "Albumblätter für die Jugend" "(1880)" }
  composer = "Cornelius Gurlitt"
  opus = "Op. 101, No. 14"
  tagline = ##f
}

grazioso = \markup { \whiteout \italic "grazioso" }
scherzando = \markup { \translate #'(3.25 . 0) \italic "scherzando" }

global = {
  \key ef \major
  \time 3/4
}

Section-A-RH = { %% mm. 1-6
  f4\) r c8. d16 |
  f8. ef16 d8. c16 bf4 |
  \tuplet 5/4 { af16_\( bf af g af } bf4.\) f8 |
  af2\( g4\) |
  fs8.\( bf16 g4 fs8. bf16 |
  g8. bf16 fs8. bf16 g4\) |
}

upperStaff = {
  \tempo "Moderato"
  \relative c'' {
    \partial 4
    bf8.\( g'16 |
    \repeat volta 2 {
      \Section-A-RH
      \tuplet 3/2 { f8\( bf g'\) } f4 c8. d16 |
    }
    \alternative {
      { c2\( bf8[\) r16 g']
      % This magic creates a slur and then manually sets its control
      % points relative to the note
      -\tweak control-points #'((0.5 . 3.2) (1.5 . 3.8) (2.5 . 3.8) (3.25 . 3.4)) ( <> )
      | }
      { c,2\( bf4\) }
    }
    \repeat volta 2 {
      f'-. c4.\(-> d8 |
      bf4\) g-. ef'-. |
      f-. c4.->\( d8 |
      bf4\) g-. ef'-. |
      f-. c4.->\( d8 |
      bf4\) g-. ef'-. |
      a,-. ef'-. a,-. |
      bf r g'\( |
      \Section-A-RH
      \tuplet 3/2 { f8\( c' g'\) } f4 c8. d16 |
      f2\( ef4\) |
    }
  }
}

Section-A-LH = { %% mm. 1-6
  \relative c' {
    r4 <af bf d f> q |
    r <g bf ef> q |
    r <f bf d> q |
    r <ef bf'> q |
    <<
      {
        bf'2.~ |
        2. |
      } \\
      {
        d,4\( ef d |
        ef d ef\) |
      }
    >>
  }
}

lowerStaff = {
  \relative c' {
    r4 |
    \Section-A-LH
    r r <f, a ef'> |
    r q\( <bf d>\) |
    r <f a ef'>\( <bf d>\) |
    bf,4-. <af' bf d>-. r |
    bf,-. <g' bf ef>-. bf,-. |
    <af' bf d>-. bf, r |
    <g' bf ef> bf, q |
    bf <af' bf d> r |
    bf, <g' bf ef> bf, |
    <gf' c ef> bf, q |
    bf <f' bf d> r |
    \Section-A-LH
    <af c>4 r \clef treble <bf f' af> |
    r <bf_\=1( d af'^\=2(> <ef\=1) g\=2)> |
  }
}

dynamics = {
  s4\p |
  s2.^\grazioso |
  s2. |
  s2. |
  s2\> s8 s8\! |
  s2. |
  s2. |
  s2.\p |
  s2. |
  s2. |
  s2.\mf^\scherzando |
  \repeat unfold 5 s2. |
  s2.\< |
  s16 s8.\! s4 s4^\grazioso |
  \repeat unfold 3 s2. |
  s2\> s8 s8\! |
  \repeat unfold 3 s2. |
  s2\> s8 s8\! |
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
