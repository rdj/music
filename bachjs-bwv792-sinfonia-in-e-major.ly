\version "2.24.2"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
}

\header {
  title = "Sinfonia in E major"
  subsubtitle = \markup { "No. 6 from" \italic "15 Sinfonias" "(1801)" }
  composer = "Johann Sebastian Bach"
  opus = "BWV 792 (1723)"
  tagline = ##f
}

\layout {
  \context {
    \PianoStaff
    \accidentalStyle piano
    %% \override TupletBracket.bracket-visibility = ##t
  }
}

global = {
  \key e \major
  \time 9/8
}

RR = { R1*9/8 } % full measure rest

breaks_ref = {
  %% breaks matching some reference for ease of authoring
  R1*9/8*3 \break |
  \barNumberCheck #4
  R1*9/8*4 \break |
  \barNumberCheck #8
  R1*9/8*4 \break |
  \barNumberCheck #12
  R1*9/8*4 \break |
  \barNumberCheck #16
  R1*9/8*4 \pageBreak |
  \barNumberCheck #20
  R1*9/8*3 \break |
  \barNumberCheck #23
  R1*9/8*3 \break |
  \barNumberCheck #26
  R1*9/8*4 \break |
  \barNumberCheck #30
  R1*9/8*4 \break |
  \barNumberCheck #34
  \grace s8 R1*9/8*4 \break |
  \barNumberCheck #38
}

%% There are only three voices, but for simplicity's sake I will model
%% it as SATB and use spacer rests in the alto/tenor when the middle
%% voice is in the other clef.

upper.soprano = \relative {
  \RR | 
  b'8 cs ds e fs gs fs gs e |
  ds4.-\parenthesize-\prall cs2. |
  b2. a4.~ |
  4. gs2. |
  cs2. ds4. |
  e2. ds4.~ |
  4. cs2. |
  bs4. cs2.~ |
  8 ds e fs gs a gs a fs |
  e gs ds e-\parenthesize-\mordent gs bs, cs-\parenthesize-\mordent e4~ |
  4. r e~ |
  4. ds2.~ |
  4. cs4. b~ |
  4. as-\parenthesize-\prall cs~ |
  2. r4. |
  b'8 as gs fs e ds e cs ds |
  b4.-\prall r r |
  \RR |
  fs8 gs a b cs d cs d b |
  a b cs d e fs e fs d |
  cs ds e fs gs a gs a fs |
  e2.~ 4.~ |
  8 e ds cs b a b a cs |
  ds4.~ 8 e fs gs fs a |
  b,2.~ 4. |
  a2. gs4.~ |
  \oneVoice
  4. fs2.~ |
  4. e ds~ |
  2.~ 4.~ |
  8 cs ds e fs gs fs gs e |
  a2.~ 4.~ |
  8 fs gs
  \voiceOne
  a b cs b cs a |
  \grace {
    \parenthesize e'8
  } ds4.\fermata r r |

  \oneVoice
  e8 ds cs b a gs a gs b |
  cs4. r r |
  b'8 a gs fs e ds e ds fs~ |
  16 e ds cs gs'8~ 16 fs e ds a'8~ 16 gs fs e b'8~ |
  8
  \voiceOne
  b, cs ds e fs e fs ds |
  e4.  r fs,4 a8 |
  \grace a gs2.\fermata 
}

upper.alto = \relative {
  e'8 fs gs a b cs b cs a |
  gs2. as4. |
  b2. a4.~ |
  4. gs2. |
  fs e4.~ |
  8 fs gs a b cs b cs a |
  gs4. fs2. |
  e ds4.~ |
  8 e fs gs a b a b gs |
  fs4. bs,2. | cs4. r r8 r gs' |
  as cs gs as cs es, fs as4~ |
  4. b fs |
  e2. ds4. |
  e2.~ 4.~ |
  8 fs gs as b cs b cs as |
  b2. as4. |
  b r r |
  b,8 cs ds e fs gs fs gs e |
  ds4. es2. |
  fs gs4. |
  a r r |
  cs8 b a gs fs e fs e gs |
  a2.~ 4.~ |
  2.~ 4.~ |
  8 gs fs e d cs d b cs |
  cs ds e ds e cs b cs ds |

  \change Staff = "down"
  \voiceOne
  cs ds b a b cs b cs a |
  gs2. fs4.~ |
  8 ds e fs gs a gs a fs |
  e4. cs'2.~ |
  8 a b cs ds e ds e cs |
  b4.

  \change Staff = "up"
  \voiceTwo
  fs'2.~ |
  4. r r |

  \change Staff = "down"
  \voiceOne
  e,8 fs gs a b cs b cs a |
  g4. r r |
  r8 fs gs a b cs b cs a |
  gs4. a b |

  \override Beam.damping = #+inf.0
  cs8

  \change Staff = "up"
  \voiceTwo
  ds e
  \override Beam.damping = 1
  fs gs a gs a fs |
  fs4. r cs8 ds4-\parenthesize_\mordent |
  \grace ds8 e2.
}

upper.all =  {
  \clef treble

  <<
    \new Voice = "soprano" {
      \voiceOne
      \upper.soprano
    }
    \new Voice = "alto" {
      \voiceTwo
      \upper.alto
    }
  >>
}

lower.tenor = \relative {
  s1*9/8*40 | s2.
}

lower.bass = \relative {
  \oneVoice
  e'2. ds4. |
  e cs fs |
  b,8 cs ds

  %% sequence in 6/8
  e  fs gs  fs gs e  |
  ds e  fs  e  fs ds
  cs ds e | ds e  cs
  b  cs ds  cs ds b |

  a4. fs b |
  e,8 fs gs
  
  a  b  cs b  cs a  |
  gs a  b  a  b  gs
  fs gs a |

  gs4. e fs |
  ds2. gs4. |
  cs, r e |
  fs r r8 r cs' |
  ds fs cs ds fs as, b ds fs, |
  gs b fs gs b ds, e gs b, |
  cs e b cs e gs, as cs e, |
  fs4. e' r |
  ds e fs |

  b,8 cs ds e fs gs fs gs e |
  ds e fs gs fs e a4.~ |
  4. gs cs |
  fs, b2. |
  a8 gs fs e ds cs bs cs ds |
  cs4. r r |
  fs r r |
  b8 a gs fs e ds e ds fs |
  gs2.~ 4.~ |
  4. fs2. |

  \voiceTwo
  e2. ds4. |
  e8 ds cs b a gs a gs b |
  bs,4. r r |
  cs r r |
  fs r r |
  ds
  \oneVoice
  r r |
  a'\fermata r r |

  \voiceTwo
  gs r r |
  as8 cs ds e fs g fs g e |
  ds4. r r |
  e fs gs |
  a
  \oneVoice
  r r |
  r8 b fs gs ds e as, b b, |
  e2._\fermata
}

lower.all = \relative {
  \clef bass

  <<
    \new Voice = "tenor" {
      \voiceOne
      \lower.tenor
    }
    \new Voice = "bass" {
      \voiceTwo
      \lower.bass
    }
  >>
}

%%showLastLength =   % use this to only render the last few measures
\score {
  \new PianoStaff <<
    \new Staff = "up" {
      \global
      \upper.all
      \bar "|."
    }
    \new Staff = "down" {
      \global
      \lower.all
    }
    \new Dynamics {
      \global
      \breaks_ref
    }
  >>
}
