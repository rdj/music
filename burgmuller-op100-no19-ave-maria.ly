\version "2.24.4"
\language "english"
\pointAndClickOff

twice = #(define-music-function (music) (ly:music?) #{ \repeat unfold 2 $music #})

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  indent = 0
  page-breaking = #ly:one-page-breaking
}

\header {
  title = "Ave Maria"
  subsubtitle = \markup { "No. 19 from" \italic "25 Études faciles et progressives" "(1851)" }
  composer = " Friedrich Burgmüller"
  opus = "Op. 100, No. 19 (1851)"
  tagline = ##f
}

\layout {
  \context {
    \PianoStaff
    \accidentalStyle piano
    printKeyCancellation = ##f
    %% \override TupletBracket.bracket-visibility = ##t
  }
}

global = {
  \key a \major
  \time 3/4
  \tempo "Andantino" 4 = 100
}

upper.A = \relative {
  \clef treble

  \repeat volta 2 {
    <cs'' a>4^1^3  q q |
    q2 a4 |
    <d gs,>4^2^5 q <cs a>^1^4 |
    q2\( <b gs>4^2^3\) |
    <e a,>4^1^5 q q |
    <<
      { e4\( d a\) } \\
      { a2 a4 }
    >> |
    <cs a>2^1^4\( <b gs>4^2^3\) |
    a2. |
  }

  <b gs>4 q q |
  <b a>2. |
  <b gs>4^2^3\( <cs a>^1^4 <e a,>^5\) |
  <b gs>2^2^3 q4 |
  <b g> q <cs g> |
  <d fs,>2 q4 |
  <a fs>4 q <b fs> |
  <cs es,>2.\fermata |

  <cs a e>4 q q|
  <cs a>2 a4^1 |
  <d gs,>4^2^5 q <cs a>^1^4 |
  q2\( <b gs>4^2^3\) |
  <<
    { e4 e e | e } \\
    { r8 a,
      \twice { bf_> \shape #'((0.5 . 0) (0.5 . 0) (0.5 . 0) (0 . 0)) ^( a) } |
      e'[ a,] e'^\( d a b^3\) }
  >> |
  <cs a>2^1^4\( <b gs>4^2^3 |
  a8-.^1\) a^3\( gs a b a\) |
  <a e>4 <a fs> <a g> |
  <a fs>2-> q4 |
  <a f> q <d a f> |
  <cs a e>2 r4 |
  <cs, a>4 q q |
  q2.\fermata
}

lower.A = \relative {
  \clef treble
  <a e'>4 q q |
  q2 <cs e>4 |
  <b e> q <a e'> |
  e'2. |
  <cs! g'>4 q q |
  <<
    { g'4-1 fs-2 f-1 } \\
    d2.-4
  >> |
  e2
  \clef bass
  <e, d'>4 |
  <a cs>2. |

  e'4\( b e\) |
  e->\( ds8 cs ds4\) |
  e\( a, cs\) |
  e2 e4 |
  e e e |
  b2 b4 |
  d4 d d |
  cs2.\fermata |
  r8 a,8_5\( cs_3 e_2 a_1 cs_2\) |
  e\( ds e a, cs e\) |
  <<
    { b4 b a } \\
    { b8 e b e a, e' }
  >> |
  e,8 e' e e e_1 e_2 |
  \clef treble
  <cs g'>4 q q |
  <<
    { g'-1 fs-2 f-1 } \\
    d2._4
  >> |
  \clef bass
  e8-._2 e_1\( ds e e, d'\) |
  <a cs>4 r r |
  <<
    { cs d e } \\
    { cs8 a d a e' a, }
  >> |
  d8\( a d cs d a\) |
  d_1\( cs d a f d\) |
  a'2 r4 |
  <a, e'>4 q q |
  q2.\fermata
}

editorial.above.A = {
  %% marks above the grand staff
  s2. * 12 |
  s4\< s s\! |
  s2\> s4\! |
  s4-\markup \italic { dim. e riten. } s2 |
  s2. * 9 |
  s4\< s s\!
  s2. |
  s8 s-\markup \italic { dimin. poco riten. } s2 |
}

editorial.between.A = {
  %% marks between the staves, e.g. dynamics
  s8\p s-\markup \italic { religioso } s2 |
  s2. |
  s4\> s s\! |
  s2. |
  s4\< s s\! |
  s\> s s\! |
  s2. * 2 |
  s4\p s2 |
  s2. |
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  s4\< s s\! |
  s2. |
  s2. * 3 |
  s2.\pp |
  s4\p s2 |
  s2. |
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  s4\> s  s\! |
  s2. |
  s2. |
  s4\> s s\! |
  s2. * 6 |
  s4\pp s2 |
}

editorial.below.A = {
  %% marks below the grand staff, e.g. pedal marks
}

breaks_ref = {
  s2. * 6 | \break
  \barNumberCheck 7
  s2. * 6 | \break
  \barNumberCheck 13
  s2. * 5 | \break
  \barNumberCheck 18
  s2. * 4 | \break
  \barNumberCheck 22
  s2. * 4 | \break
  \barNumberCheck 26
}

%%showLastLength =   % use this to only render the last few measures
\score {
  \new PianoStaff <<
    \new Dynamics {
      \global
      \editorial.above.A
    }
    \new Staff = "up" {
      \global
      \upper.A
      \bar "|."
    }
    \new Dynamics {
      \global
      \editorial.between.A
    }
    \new Staff = "down" {
      \global
      \lower.A
    }
    \new Dynamics {
      \global
      \editorial.below.A
    }
    \new Dynamics {
      \global
      \breaks_ref
    }
  >>
}
