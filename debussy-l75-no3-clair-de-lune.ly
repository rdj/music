\version "2.24.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  indent = 0
}

\header {
  title = "Clair de Lune"
  subsubtitle = \markup { "No. 3 from" \italic "Suite bergamasque" "(1905)" }
  composer = "Claude Debussy"
  opus = "L. 75, No. 3 (1890–1905)"
  tagline = ##f
}

\layout {
  \context {
    \PianoStaff
    \consists "Span_stem_engraver"
    \accidentalStyle piano
    \override TupletBracket.bracket-visibility = ##f
    printKeyCancellation = ##f
  }
}

global = {
  \key df \major
  \time 9/8
  \tempo "Andante très expressif"

  %% Note: I originally put these merge defaults in the PianoStaff
  %% context, but then I had trouble turning them off in m.59. By
  %% putting them here, they are added to each Staff, and in that case
  %% turning them briefly off and then back on seems to work fine.
  \mergeDifferentlyDottedOn
  \mergeDifferentlyHeadedOn
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% A = mm. 1-14 "Andante très expressif"

upper.A_soprano = \relative {
  s8
  \change Staff = "down"
  <af' f>
  -\shape #'(((-1 . -5) (-0.5 . 5) (0 . -2.5) (-0.5 . 0)))
  \(
  \oneVoice
  \change Staff = "up"
  <af' f>~ q4.
  <f df>4.~\) |
  q8\( <ef c> <f df> <ef c>2.~\) |
  q8\( <df bf> <ef c>
  \voiceOne
  \tuplet 2/3 { df f~ }
  \tuplet 2/3 { 8 df~ } |
  <df bf> <c af> <df bf>
  <c af>2.\)~ |
  c8\( bf c bf ef bf af bf af~ |
  8 gf af gf4. f4.~\) |
  8\( f gf f bf f ef f ef~ |
  8 df ef df4. c4.\) |
  \oneVoice
  r4
  -\shape #'(((0 . -8) (0 . 1) (-1 . 1.5) (0 . 0))) \(
  r8 <af'' f>4. <f df>4.~\) |
  \voiceOne
  q8\( ef f ef2.\)~ |
  8\( <df df,> <ef ef,> <af df, af>4. <f df f,>4.\)~ |
  f8\( ef f ef4. df4.\)~ |
  8\( <df df,> <ef ef,> \tuplet 2/3 { <bf' bf,> <af af,>~ } \tuplet 2/3 { q <f f,>~ } |
  f8 ef f \tuplet 2/3 { ef df~ } \tuplet 2/3 { 8 bf\) } |
}

upper.A_alto = \relative {
  \oneVoice
  r8
  r8
  \voiceTwo
  s8
  s2. |
  s1*9/8*1 |
  s4.
  bf'2.~ |
  \once \hideNotes 8 s4 s2. |
  gf2. 4. |
  ef2. 4. |
  df2.~ 4. |
  bf2. af4. |
  s1*9/8 |
  r8 <bf' gf>4~ q2. |
  r8 af4 s2. |
  r8 <bf gf>4~ q2. |
  r8 af4 f'2. |
  r8 <bf, f>4~ 2. |
}

upper.A = {
  \clef treble
  <<
    \new Voice = "soprano" {
      \voiceOne
      \upper.A_soprano
    }
    \new Voice = "alto" {
      \voiceTwo
      \upper.A_alto
    }
  >>
}

lower.A_tenor = \relative {
  \oneVoice
  r8
  \once \hideNotes
  <af' f>4~
  q2. |
  <a gf>2.~ q4. |
  <af f>2.~ q4. |
  <gf ef>2.~ q4. |
  <ef df>2. <ef c>4. |
  <df bf>2. <c a>4. |

  \clef bass
  \voiceOne
  bf2.~ 4. |
  af2. gf4. |
  s2. s4. |
  r8 <df' bf gf df>4~ q2. |
  r8 <af f>4\( <f' df>4. <df af>\) |
  r8 <df bf gf df>4~ q2. |
  r8 <cf f,>4
  \override TieColumn.tie-configuration = #'((6 . 1) (8 . 0) (10 . 0))
  <f df cf>4.~
  q8
  \revert TieColumn.tie-configuration
  r r |
  r8
  <<
    {
      ef4~ \tuplet 2/3 { 8 df~ } 4.
    } \\ {
      <bf f>4~ q2.
    }
  >>
}

lower.A_bass = \relative {
  s1*9/8*6 |

  \barNumberCheck #7
  af2. gf4. |
  f2. \tuplet 2/3 { ef8 af,^~ } |
  \oneVoice
  <af df,>8_\(
  \change Staff = "up"
  <af' f>
  \change Staff = "down"
  \clef treble
  <f' af>~ q2.\) |
  \clef bass
  \voiceTwo
  <df, gf,>2. s4. |
  <df f,>2. s4. |
  <df gf,>2. s4. |
  af2.~ 4. |
  bf2. s4. |
}

lower.A = {
  \clef treble
  <<
    \new Voice = "tenor" {
      \voiceOne
      \lower.A_tenor
    }
    \new Voice = "bass" {
      \voiceTwo
      \lower.A_bass
    }
  >>
}

editorial.above.A = {
  s1*9/8*14 |
  \barNumberCheck #15
}

editorial.between.A = {
  s8\pp
  s8
  s16
  s16 ^"con sordina"
  s2. |
  s1*9/8*11 |
  \barNumberCheck #13
  s8
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  s8\< s8 s8\!
  s1*5/8 |
  s8 s8 s8
  \tuplet 2/3 {
    s8 s8\> s8 s8\!
  } |
  \barNumberCheck #15
}

editorial.below.A = {
  s1*9/8*14 |
  \barNumberCheck #15
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% B = mm. 15-26 "Tempo rubato"

upper.B_soprano = \relative {
  \oneVoice

  \once \override TupletBracket.bracket-visibility = ##t
  \tuplet 2/3 {
    r8 <f'' bf f'>8^-~\(
  }
  q8 <ef bf' ef>^- q^-
  q^- <df bf' df>^- q^- |
  q^- <c gf' bf c>^- q^-
  \tuplet 2/3 {
    q^- <df bf' df>^-
  }
  <bf gf' bf>4.^-\) |

  \once \override TupletBracket.bracket-visibility = ##t
  \tuplet 2/3 {
    r8 <f' bf f'>8^-~\(
  }
  q <gf bf gf'> <f bf f'>
  <ef bf' ef> <f bf f'> <ef bf' ef> |
  <df bf' df> <ef bf' ef> <df bf' df>
  \tuplet 2/3 {
    <c bf' c>
    \slashedGrace ef'
    %-\vshape #'(((0 . 0) (0 . 0) (0 . 0) (0 . 0)))
    (
    <df bf) df,>
  }
  <bf, gf' bf>4.~\) |
  \tuplet 6/9 {
    q8[\( <gf gf'> <af ef' af> <c c'> <bf gf' bf> <gf gf'>]\)
  } |
  r8 <gf c ef gf>^-\( q^- q^- q^- <af c ef af>^- <gf c ef gf>4.^-\) |

  \voiceOne
  \tuplet 6/9 {
    r8 <gf gf'>[\( <af af'> <df df'> <bf bf'> <gf gf'>]\)
  } |
  \oneVoice
  r8 <gf bf ef gf>^-\( q^- q^- q^- <af c f af>^- <gf bf ef gf>4.^-\) |
  \voiceOne
  \tuplet 6/9 {
    r8 <gf gf'>[\( <af af'> <ef' ef'> <df df'> <bf bf'>]\)
  } |
  \oneVoice
  r8 <bf gf' bf>\( q q q <c af' c> <bf gf' bf> <df bf' df> <ef bf' ef>\) |

  \ottava #1
  <af df af'>2.^-\arpeggio q4.^-\arpeggio |
  q2.^-\arpeggio
  \ottava #0
  <af, ef' af>4.^-\arpeggio |
}

upper.B_alto = \relative {
  s1*9/8*6 |
  \barNumberCheck #21
  \once \omit TupletNumber
  \tuplet 6/9 {
    s8 df''4 s8 gf4
  } |
  s1*9/8 |
  \once \omit TupletNumber
  \tuplet 6/9 {
    s8 <df bf>4 s8 <bf' gf>4
  } |
  s1*9/8*3 |
}

upper.B = {
  <<
    \context Voice = "soprano" {
      \voiceOne
      \upper.B_soprano
    }
    \context Voice = "alto" {
      \voiceTwo
      \upper.B_alto
    }
  >>
}

lower.B_tenor = \relative {
  \once \override TupletBracket.bracket-visibility = ##t
  \tuplet 2/3 {
    r8
    \clef treble
    \override TieColumn.tie-configuration = #'((0 . 1) (-1 . 1) (-4 . -1))
    <bf' gf f>_-~_\(
  }
  q8
  \revert TieColumn.tie-configuration
  <bf gf ef>_- q_-
  q_- <bf gf df>_- q_-
  q_- <bf gf c,>_- q_-
  \tuplet 2/3 {
    q_- <bf gf df>_-
  }
  <gf df bf>4._-\) |
  \clef bass
  \tuplet 2/3 {
    s8
    \clef treble
    \override TieColumn.tie-configuration = #'((0 . 1) (-1 . 1) (-4 . -1))
    <bf gf f>_-~_\(
  }
  q8
  \revert TieColumn.tie-configuration
  <ef bf gf> <bf gf f>
  <bf gf ef> <bf gf f> <bf gf ef> |
  <bf gf df> <bf gf ef> <bf gf df>
  \tuplet 2/3 { <bf gf c,> <bf gf df> }
  <gf ef bf>4.\) |
  \clef bass
  <<
    \relative {
      \voiceOne
      \stemDown
      \tupletDown
      \tweak TupletNumber.Y-offset #-2.5
      \tuplet 6/9 {
        r8 gf[_\( af c bf gf]\)
      } |
      r8 <gf c ef>^\( q
      q q <af c ef> <gf c ef>4.\) |
      \tweak TupletNumber.Y-offset #-2.5
      \tuplet 6/9 {
        r8 gf[_\( af df bf gf]\)
      } |
      r8 <gf bf ef>^-\( q^-
      q^- q^- <af c f>^-
      <gf bf ef>4.^-\) |
      \tweak TupletNumber.Y-offset #-2
      \tuplet 6/9 {
        r8 gf[_\( af ef' df bf]\)
      } |
      r8 <bf df gf>_\( q q q <c ef af> <bf df gf>
      \clef treble
      <df gf bf> <ef gf bf>\) |
    } \\
    \relative {
      \voiceThree
      \once \omit TupletNumber
      \tuplet 6/9 {
        s8 s8 <c' ef>4 <ef gf>4
      } |
      s1*9/8 |
      \once \omit TupletNumber
      \tuplet 6/9 {
        s8 <bf df>4 s8 <gf' df>4
      } |
      s1*9/8 |
      \once \omit TupletNumber
      \tuplet 6/9 {
        s8 <df bf>4 s8 <bf' gf>4
      } |
    }
  >>

  \oneVoice
  <f af df f>2.\arpeggio^-\( <ff af bf df ff>4.\arpeggio^- |
  \once \stemDown
  <ef gf af df ef>2.\arpeggio^-\) <af, ef' gf c>4.\arpeggio |
  \clef bass
}

lower.B_bass = \relative {
  <ef, ef,>2. s4. |
  s1*9/8 |
  <<
    \absolute {
      \voiceTwo
      <ef, ef,,>2.
    } \\
    \absolute {
      \voiceThree
      bf,2.^\markup { \small \italic "m.d." }
    }
  >>
  s4. |
  s1*9/8 |
  <af af,>2. s4. |
  <a a,>2. s4. |
  <bf bf,>2. s4. |
  <c c,>2. s4. |
  <df df,>2. s4. |
  <ef ef,>2. s4. |
  s1*9/8 * 2 |
  \barNumberCheck #27
}

lower.B = {
  <<
    \context Voice = "tenor" {
      \voiceOne
      \lower.B_tenor
    }
    \context Voice = "bass" {
      \voiceTwo
      \lower.B_bass
    }
  >>
}

editorial.above.B = {
  \tempo "Tempo rubato"
  s1*9/8*4 |
  s8 s8-
  \markup {
    \override #'(line-width . 45)
    \fill-line { peu à peu cresc. et animé }
  }
  s8 s2. |
  s1*9/8*7 |
  \barNumberCheck #27
}

editorial.between.B = {
  s8\pp
  s1*8/8 |
  s1*9/8*9 |
  s8-
  \markup {
    \override #'(line-width . 20)
    \fill-line { dim. molto }
  } s4 s2. |
  s1*9/8*1 |
  \barNumberCheck #27
}

editorial.below.B = {
  s1*9/8*12 |
  \barNumberCheck #27
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% C = mm. 27-36  "Un poco mosso"

upper.C_soprano = \relative {
  <af' f>2.\( cf4 df8\) |
  <af f>2.\( <cf af>4 af8\) |
  \oneVoice
  <df f,>4\( <ef af,>8 <f df>4. <df f,>4 <f df>8\)
  <g ef>\( <f df> <df bf>
  \voiceOne
  <df bf>4.\) r4 r8 |
  bf2.\( c4 f8\) |
  bf,2.\( c4 f8\) |
  gf4.~\(
  \tuplet 4/6 {
    8[ f d ef]
  } |
  bf'2. af4.\)
  <af f>2.\( <cf af>4 df8\) |
  <af f>2.\( <b gs>4 gs8\) |
}

upper.C_alto = \relative {
  s2. af'4. |
  s1*9/8*2 |
  s1*3/8
  \change Staff = "down"
  \once \stemUp
  g8
  -\shape #'((1 . 1.5) (-1 . 6) (0 . -1) (0 . 0))
  \(
  \change Staff = "up"
  f df
  df8. bf\) |

  s2. s4 af'16 f |
  s2. s4 af16 f |
  s4. gf'16 gf, bf f' gf, bf d gf, bf ef gf, bf |
  s1*9/8*3 |
}

upper.C = {
  <<
    \context Voice = "soprano" {
      \voiceOne
      \upper.C_soprano
    }
    \context Voice = "alto" {
      \voiceTwo
      \upper.C_alto
    }
  >>
}

up = {
  \change Staff = "up"
  \stemDown
}
dn = {
  \change Staff = "down"
  \voiceOne
}

lower.C_tenor = \relative {
  %% Not sure why lilypond gets confused here, but it places the two
  %% staves too close together in this particular system and then
  %% complains about the beam slope on the staff-crossing figuration.
  %% We can fix it by just adding a little space between the staves.
  %% It doesn't happen every time because often there are other
  %% objects between the staff like hairpins that it has to work to
  %% avoid, introducing more space naturally.
  \once \override Score.NonMusicalPaperColumn.line-break-system-details = #'((alignment-distances . (11)))
  df,16_\( af' df f \up af df\) \dn
  f,,_\( c' f \up af c f\) \dn
  af,,_\( ff' af \up cf ff af\) \dn
  df,,,_\( af' df f \up af df\) \dn
  f,,_\( c' f \up af c f\) \dn
  af,,_\( ff' af \up cf af' ff\) \dn
  s1*9/8*2
  af,,16_\( ef' gf bf \up c gf'\) \dn
  gf,,_\( df' gf bf \up df gf\) \dn
  f,,_\( c' f af c8\) |
  af,16_\( ef' gf bf \up c gf'\) \dn
  gf,,_\( df' gf bf \up df gf\) \dn
  f,,_\( c' f af c8\) |
  ef,,16_\( bf' ef gf bf ef\) s1*6/8 |
  d16_\( gf bf \up bf gf' bf\) \dn
  ef,,_\( gf bf \up bf gf' bf\) \dn
  c,,
  _\shape #'((1 . 0.5) (0 . 0) (0 . 0) (0 . 0)) \(
  e af \up c e af\) \dn |
  df,,,
  _\shape #'((0 . 0) (0 . 0) (0 . -2) (0 . 0)) \(
  af' df f \up af df\) \dn
  af,
  _\shape #'((1 . 0.5) (0 . 0) (0 . -2) (0 . 0)) \(
  c f \up af c f\) \dn
  cf,
  _\shape #'((1 . 0.5) (0.5 . 0) (0.5 . -3) (0 . 0)) \(
  ff af \up cf ff af\) \dn |
  df,,,
  _\shape #'((0 . 0) (0 . 0) (0 . -2) (0 . 0)) \(
  af' df f \up af df\) \dn
  af,
  _\shape #'((1 . 0.5) (0 . 0) (0 . -2) (0 . 0)) \(
  c f \up af c f\) \dn
  b,,
  _\shape #'((1 . 0.5) (0 . 0) (0.5 . -2) (0 . 0)) \(
  e gs \up b gs'! e\) \dn |
}

lower.C_bass = \relative {
  df,4. f af |
  df, f af |
  df,16^\( af' df f af df f af f df af f af f df af df af\) |
  ef_\( bf' ef g bf ef g ef bf g ef df ef, bf' ef g ef bf\) |
  af4. gf f |
  af gf f |
  ef4.
  \tuplet 4/6 {
    gf''8[^\( f d ef]\)
  } |
  \clef treble
  d4. ef af, |
  \clef bass
  df,4. f af |
  df, f gs |
}

lower.C = {
  <<
    \context Voice = "tenor" {
      \voiceOne
      \lower.C_tenor
    }
    \context Voice = "bass" {
      \voiceTwo
      \lower.C_bass
    }
  >>
}

editorial.above.C = {
  \tempo "Un poco mosso"
  s1*9/8*10 |
  \barNumberCheck #37
}

editorial.between.C = {
  s8\pp
  s1*8/8 |
  s1*9/8*1 |
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  s4\< s8 s4. s4 s8\! |
  s1*9/8*1 |
  s2.\p
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  s4\< s16\! s |
  s2.\p
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  s4\< s16\! s |
  s1*9/8*2 |
  %% Make room between staves for the cresc.
  \once \override Score.NonMusicalPaperColumn.line-break-system-details = #'((alignment-distances . (12)))
  s16
  \tweak TextScript.extra-offset  #'(5 . 20)
  s
  - \tweak extra-offset  #'(0 . 2.5) - "cresc."
  s4 s2. |
  s1*9/8 |
  \barNumberCheck #37
}

editorial.below.C = {
  s1*9/8*10 |
  \barNumberCheck #37
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% D = mm. 37-42 "En animant"

upper.D_soprano = \relative {
  cs'''4( gs8) e'4( cs8) gs'4( e8) |
  gs4.( fs2.) |
  fs2.\( a4 cs8\) |
  fs,,2.\( a4 cs8\) |
  \oneVoice
  <e cs>8\( <ds b> <cs a>
  \tuplet 2/3 { <b gs> <a fs>~ }
  q <gs e> <fs ds>\) |
  \voiceOne
  <e cs>\( <ds b> <cs a> <b gs> <a fs> <gs e>~ q <fs ds> <e cs>\) |
}

upper.D_alto = \relative {
  cs'''8. cs,16 gs' e
  e'8. e,16 cs' gs
  gs'8. gs,16 e' b |
  s1*9/8*4 |
  \resetRelativeOctave c'
  s2. a4. |
}

upper.D = {
  \barNumberCheck #37
  \key cs \minor
  <<
    \context Voice = "soprano" {
      \voiceOne
      \upper.D_soprano
    }
    \context Voice = "alto" {
      \voiceTwo
      \upper.D_alto
    }
  >>
  \barNumberCheck #43
}

lower.D_tenor = \relative {
  cs'16\( e gs b8.\)
  e,16\( gs b cs8.\)
  gs16\( b cs e8.\) |
  gs,16_\( a cs \up gs' cs a\) \dn
  fs,_\( a cs \up fs cs' a\) \dn
  %% Maybe? placement of sharp is a bit confusing
  %\once \override NoteColumn.force-hshift = 1.5
  fs,
  -\shape #'((0 . -1) (1 . 0) (0 . 0) (0 . 0)) _\(
  a cs \up fs cs' a\) \dn |
  fs,_\( a cs \up fs cs' a\) \dn
  fs,_\( a cs \up fs cs' a\) \dn
  e,_\( a cs e \up cs'' cs,\) \dn |
  \resetRelativeOctave c'
  b_\( ds fs \up fs cs' a\) \dn
  a,_\( cs e \up fs cs' a\) \dn
  gs,_\( cs e a \up e' a\) \dn
  fs,,^\( cs' e fs a cs e fs e cs a fs\) e\( fs e cs a fs\) |
}

lower.D_bass = \relative {
  \clef treble
  b4. cs e |
  gs fs
  es |
  e ds cs |
  b a gs |
  fs2.~ 4. |
  \clef bass
  \oneVoice
  fs,16\( cs' e fs a cs e cs a fs e cs\)
  fs,\( cs' fs, cs' fs, cs'\) |
}

lower.D = {
  \barNumberCheck #37
  \key cs \minor
  <<
    \context Voice = "tenor" {
      \voiceOne
      \lower.D_tenor
    }
    \context Voice = "bass" {
      \voiceTwo
      \lower.D_bass
    }
  >>
  \barNumberCheck #43
}

editorial.above.D = {
  \tempo "En animant"
  \barNumberCheck #37
  s1*9/8*6 |
  \barNumberCheck #43
}

editorial.between.D = {
  \barNumberCheck #37
  s8 s8-"più cresc." s1*7/8 |
  s1*9/8*3 |
  s8\f s1*8/8 |
  s8-"dim." s1*8/8 |
  \barNumberCheck #43
}

editorial.below.D = {
  \barNumberCheck #37
  s1*9/8*6 |
  \barNumberCheck #43
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% E = mm. 43-50 "Calmato"

upper.E_soprano = \relative {
  <ef' df>2.\( <gf ef>4 <bf gf ef>8\) |
  <ef, df>2.\( <gf ef>4 <bf~ gf~ ef>8\) |
  <bf gf df>8\( <f' c af> <ef bf gf> <bf gf>4. <af gf>\) |
  <bf gf df>8\( <f' c af> <ef bf gf> <bf gf>4. <af gf>\) |
  ef'2.\( gf4 bf8\) |
  ef,2.\( gf4 bf8\) |
  ef2.~\( 4.~ |
  4. df ef\) |
}

upper.E_alto = \relative {
  gf4\( af8 bf4 df8 c4.\) |
  gf4\( af8 bf4 df8 c4.\) |
  s4. df8 bf df bf c ef |
  s4. df8 bf df bf c ef |
  ef'16 ef,\( gf bf gf ef\)
  r16   ef\( gf bf gf ef\) s4. |
  ef'16 ef,\( gf bf gf ef\)
  r16   ef\( gf bf gf ef\) s4. |
  s1*9/8*2 |
}

upper.E = {
  \key df \major
  \barNumberCheck #43
  <<
    \context Voice = "soprano" {
      \voiceOne
      \upper.E_soprano
    }
    \context Voice = "alto" {
      \voiceTwo
      \upper.E_alto
    }
  >>
  \barNumberCheck #51
}

lower.E_tenor = \relative {
  s1*9/8*4 |
  \repeat unfold 2 {
    df'2. c16
    -\shape #'((0 . 0) (1.5 . -1.5) (1 . -2) (0 . 0)) _\(
    ef gf bf \up c ef\) \dn |
  }
  gf,16\( bf df \up ef gf bf\) \dn
  gf,16\( bf df \up ef gf c\) \dn
  gf,16\( bf df \up ef gf bf\) \dn |
  gf,16\( a df \up ef gf a\) \dn
  gf,16\( a df \up ef gf cf\) \dn
  gf,16\( a df \up ef gf a\) \dn
}

lower.E_bass = \relative {
  af,16^\( \repeat unfold 17 { ef' af, } ef'\) |
  af,^\( ef af ef' af, ef' af ef af ef' af, ef af ef af, ef' af, ef\) |
  af^\( ef af ef' af, ef' af ef af ef' af, ef af ef af ef af ef\) |
  gf4\( af8 bf4 df8 c4.\) |
  gf4\( af8 bf4 df8 c4.\) |
  \clef treble
  gf'2.~ 4. |
  gf2. 4. |
}

lower.E = {
  \key df \major
  \barNumberCheck #43
  <<
    \context Voice = "tenor" {
      \voiceOne
      \lower.E_tenor
    }
    \context Voice = "bass" {
      \voiceTwo
      \lower.E_bass
    }
  >>
  \barNumberCheck #51
}

editorial.above.E = {
  \tempo Calmato
  \barNumberCheck #43
  s1*9/8*8 |
  \barNumberCheck #51
}

editorial.between.E = {
  \barNumberCheck #43
  s8\pp s1*8/8 |
  s1*9/8*7 |
  \barNumberCheck #51
}

editorial.below.E = {
  \barNumberCheck #43
  s1*9/8*8 |
  \barNumberCheck #51
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% A′ = mm. 51-65 "a Tempo 1º"

upper.A′_soprano = \relative {
  \oneVoice
  r4 r8
  \ottava #1
  <af''' f>4.\( f4.~ |
  8 <ef c> <f df> <ef c>2.~\) |
  q8\( <df bf> <ef c> \tuplet 2/3 { <df bf> <f df>~ } \tuplet 2/3 { q <df bf>~ } |
  q <c af> <df bf> <c af>2.\) |
  \ottava #0
  r8 <bf gf>8\( <c af>
  \voiceOne
  bf ef bf af bf af~\) |
  \oneVoice
  <af f>\( <gf ef> <af f> <gf ef>4. <f~ a,>\) |
  \voiceOne
  f8\( <f df> <gf ef> f bf f ef f ef~ |
  8 <df bf> <ef c> <df bf>4. <c af>\) |
  \oneVoice
  r4 r8 <af' f>4.(\( <f df>~) |
  \voiceOne
  q8 ef f ef2.~\) |
  8 <df df,>\( <ef ef,> <af f af,>4. <f~ df f,> |
  f8 ef f ef4. df\) |
  \oneVoice r8 \voiceOne
  df,\( ef <bf' f df>4. <f df af>\) |
  \oneVoice r8 \voiceOne
  gf\( af df4. bf\) |
  \oneVoice r8 \voiceOne
  bf\( c f4. <af, gf c,>4.\) |
}

upper.A′_alto = \relative {
  s1*9/8*4 |
  s4. gf''4. f~ |
  \once \hideNotes 8
  s4 s2. |
  s4. df4. df |
  s1*9/8*2 |
  s8 <bf gf>4~ 2. |
  r8 af4 s2. |
  r8 <bf f>4~ q2. |
  s8 af,4( \once \hideNotes df4.) s4. |
  s8 <df bf>4( <bf' gf>4.) <gf df> |
  s8 <gf c,>4 <c af>4. s4. |
}

upper.A′ = {
  \barNumberCheck #51
  <<
    \context Voice = "soprano" {
      \voiceOne
      \upper.A′_soprano
    }
    \context Voice = "alto" {
      \voiceTwo
      \upper.A′_alto
    }
  >>
  \barNumberCheck #66
}

lower.A′_tenor = \relative {
  \accidentalStyle forget
  \accidentalStyle piano
  f'16
  -\shape #'((0 . 0) (1 . 2) (2 . -2) (2 . 5)) ^\(
  af c f af c\) r4 r8 r4 r8 |
  f,,16\( a c ef f a\) r4 r8 r4 r8 |
  f,16\( af! bf df f af\) r4 r8 r4 r8 |
  ef,16\( gf af c ef gf\) r4 r8 r4 r8 |
  df,16\( ef gf bf df ef\) r4 r8 <c af f ef c>4.\arpeggio |
  c,,16\( gf' bf c ef gf bf4.\) <ef, c>4. |
  af,!16\( bf df f af bf\) r4 r8 <ef, df bf gf>4.\arpeggio |
  f,16\( af bf df f af\) r4 r8 <c, gf>4. |
  %% Fit the treble clef inside the beamed eighths
  \once \override Score.NonMusicalPaperColumn.line-break-system-details = #'((alignment-distances . (12)))
  <af, df,>8 \up <af' f> \dn
  \clef treble
  <af' f>~ q2. |
  \clef bass
  r8 <df,, gf bf df>4~ 2. |
  r8 <f af>4\( <df' f>4. df\) |
  r8 ef4~ 4.( df) |
  s1*9/8 |
  r4 r8 s2. |
  \tuplet 2/3 { af,8\( ef' }
  \clef treble
  \absolute af''4.
  \clef bass
  \oneVoice
  af\) |
}

lower.A′_bass = \relative {
  f'2._- 4._- |
  2._- 4._- |
  2._- 4._- |
  ef2._- 4._- |
  df2.( c4.) |
  \clef bass
  c,2.( f4.) |
  \clef treble
  af2.( \once \hideNotes gf4.) |
  \clef bass
  f2.( \tuplet 2/3 { ef8) af, -\shape #'(() ((0 . 0) (0 . 0) (-1.5 . 0) (-1.5 . 0))) -~ } |
  <<
    \context Voice = "bass" \relative {
      \voiceTwo
      \mergeDifferentlyHeadedOff
      \mergeDifferentlyDottedOff
      <af, df,>2. s4.
      \mergeDifferentlyHeadedOn
      \mergeDifferentlyDottedOn
      <df gf,>2. s4. |
      af2. s4. |
      bf2. s4. |
      \oneVoice
      f2.~ 4. |
      \voiceTwo
      ef2. s4. |
      af2. s4. |
    }
    \new Voice = "overlapped" \relative {
      \voiceFour
      s4. cf'2._> |
      s1*9/8 |
      s4. cf4.~ 4. |
      s8 <bf f>4~ 2. |
      s1*9/8 |
      s4 s8 ef,4.^( ef') |
    }
  >> |
}

lower.A′ = {
  \barNumberCheck #51
  <<
    \context Voice = "tenor" {
      \voiceOne
      \lower.A′_tenor
    }
    \context Voice = "bass" {
      \voiceTwo
      \lower.A′_bass
    }
  >>
  \barNumberCheck #66
}

editorial.above.A′ = {
  \tempo "a Tempo 1º"
  \barNumberCheck #51
  s1*9/8*15 |
  \barNumberCheck #66
}

editorial.between.A′ = {
  \barNumberCheck #51
  s8\ppp s1*8/8 |
  s1*9/8*7 |
  s8\pp s1*8/8 |
  s1*9/8*6 |
  \barNumberCheck #66
}

editorial.below.A′ = {
  \barNumberCheck #51
  s1*9/8*15 |
  \barNumberCheck #66
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% C′ = mm. 66-72 "morendo jusqu'à la fin"

upper.C′_soprano = \relative {
  s1*9/8 |
  r4 r8 cf''4.( df) |
  s1*9/8 |
  r4 r8 cf'4.( df) |
  cf\( df ff\) |
  \oneVoice
  <af f>2.~ q4. |
  <af f df af>2.\arpeggio r4 r8 |
}

upper.C′_alto = \relative {
  s1*9/8 |
  s4. af'4. ff |
  s1*9/8 |
  s4. af'2. |
  af2. s4. |
  s1*9/8*2 |
}

upper.C′ = {
  \barNumberCheck #66
  <<
    \context Voice = "soprano" {
      \voiceOne
      \upper.C′_soprano
    }
    \context Voice = "alto" {
      \voiceTwo
      \upper.C′_alto
    }
  >>
  \barNumberCheck #73
}

lower.C′_tenor = \relative {
  df,16^\( af' df f \up af df\) \dn
  f,,^\( c' f \up af c f\) \dn
  df,,^\( af' df f \up af df\) \dn |
  f,,_\( c' f \up af c f\) \dn
  af,,
  -\shape #'((0 . 0) (0 . 0) (1 . -3) (1 . -0.5)) _\(
  ff' af cf ff gf af4.\) \dn |
  \once \override Score.NonMusicalPaperColumn.line-break-system-details = #'((alignment-distances . (12)))
  df,,16^\( af' df f \up af df\) \dn
  f,,^\( c' f \up af c f\) \dn
  df,,^\( af' df f \up af df\) \dn |
  f,,_\( c' f \up af c f\) \dn
  af,,_\( cf ff af cf ff~ 4.\) |
  af,,16_\( cf ff af cf ff~ 4.\) s4. |
  \resetRelativeOctave c,
  df16^\( af' df f af df
  \clef treble
  \stemDown
  f8 af df f af df\) |
  \stemNeutral
}

lower.C′_bass = \relative {
  df,4. f df |
  f af2. |
  df4. f df |
  f
  \clef treble
  af2. |
  af
  \clef bass
  af,4. |
  df,2. s4. |
  \oneVoice
  \resetRelativeOctave c'
  <df af' df f>2.\arpeggio r4 r8 |
}

lower.C′ = {
  \barNumberCheck #66
  <<
    \context Voice = "tenor" {
      \voiceOne
      \lower.C′_tenor
    }
    \context Voice = "bass" {
      \voiceTwo
      \lower.C′_bass
    }
  >>
  \barNumberCheck #73
}

editorial.above.C′ = {
  \barNumberCheck #66
  s16\pp
  s -\tweak extra-offset #'(1 . 1) -"morendo jusqu’à la fin"
  s1*8/8 |
  s1*9/8*6 |
  \barNumberCheck #73
}

editorial.between.C′ = {
  \barNumberCheck #66
  s1*9/8*7 |
  \barNumberCheck #73
}

editorial.below.C′ = {
  \barNumberCheck #66
  s1*9/8*7 |
  \barNumberCheck #73
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

breaks_ref = { %% Durand urtext
  R1*9/8 * 3 | \break
  \barNumberCheck #4
  R1*9/8 * 4 | \break
  \barNumberCheck #8
  R1*9/8 * 4 | \break
  \barNumberCheck #12
  R1*9/8 * 3 | \break
  \barNumberCheck #15
  R1*9/8 * 3 | \pageBreak
  \barNumberCheck #18
  R1*9/8 * 3 | \break
  \barNumberCheck #21
  R1*9/8 * 3 | \break
  \barNumberCheck #24
  R1*9/8 * 3 | \break
  \barNumberCheck #27
  R1*9/8 * 2 | \break
  \barNumberCheck #29
  R1*9/8 * 2 | \pageBreak
  \barNumberCheck #31
  R1*9/8 * 2 | \break
  \barNumberCheck #33
  R1*9/8 * 2 | \break
  \barNumberCheck #35
  R1*9/8 * 2 | \break
  \barNumberCheck #37
  R1*9/8 * 2 | \break
  \barNumberCheck #39
  R1*9/8 * 2 | \pageBreak
  \barNumberCheck #41
  R1*9/8 * 2 | \break
  \barNumberCheck #43
  R1*9/8 * 2 | \break
  \barNumberCheck #45
  R1*9/8 * 2 | \break
  \barNumberCheck #47
  R1*9/8 * 2 | \break
  \barNumberCheck #49
  R1*9/8 * 2 | \pageBreak
  \barNumberCheck #51
  R1*9/8 * 2 | \break
  \barNumberCheck #53
  R1*9/8 * 2 | \break
  \barNumberCheck #55
  R1*9/8 * 2 | \break
  \barNumberCheck #57
  R1*9/8 * 2 | \break
  \barNumberCheck #59
  R1*9/8 * 3 | \pageBreak
  \barNumberCheck #62
  R1*9/8 * 3 | \break
  \barNumberCheck #65
  R1*9/8 * 2 | \break
  \barNumberCheck #67
  R1*9/8 * 2 | \break
  \barNumberCheck #69
  R1*9/8 * 2 | \break
  \barNumberCheck #71
}

breaks_mine = {
  R1*9/8 * 3 | \break
  \barNumberCheck #4
  R1*9/8 * 4 | \break
  \barNumberCheck #8
  R1*9/8 * 4 | \break
  \barNumberCheck #12
  R1*9/8 * 3 | \pageBreak
  \barNumberCheck #15
  R1*9/8 * 3 | \break
  \barNumberCheck #18
  R1*9/8 * 3 | \break
  \barNumberCheck #21
  R1*9/8 * 3 | \break
  \barNumberCheck #24
  R1*9/8 * 3 | \pageBreak
  \barNumberCheck #27
  R1*9/8 * 2 | \break
  \barNumberCheck #29
  R1*9/8 * 2 | \break
  \barNumberCheck #31
  R1*9/8 * 2 | \break
  \barNumberCheck #33
  R1*9/8 * 2 | \break
  \barNumberCheck #35
  R1*9/8 * 2 | \pageBreak
  \barNumberCheck #37
  R1*9/8 * 2 | \break
  \barNumberCheck #39
  R1*9/8 * 2 | \break
  \barNumberCheck #41
  R1*9/8 * 2 | \break
  \barNumberCheck #43
  R1*9/8 * 2 | \break
  \barNumberCheck #45
  R1*9/8 * 2 | \pageBreak
  \barNumberCheck #47
  R1*9/8 * 2 | \break
  \barNumberCheck #49
  R1*9/8 * 2 | \break
  \barNumberCheck #51
  R1*9/8 * 3 | \break
  \barNumberCheck #54
  R1*9/8 * 2 | \break
  \barNumberCheck #56
  R1*9/8 * 3 | \pageBreak
  \barNumberCheck #59
  R1*9/8 * 3 | \break
  \barNumberCheck #62
  R1*9/8 * 4 | \break
  \barNumberCheck #66
  R1*9/8 * 2 | \break
  \barNumberCheck #68
  R1*9/8 * 2 | \break
  \barNumberCheck #70
}


%%showLastLength =   % use this to only render the last few measures
\score {
  \new PianoStaff <<
    \new Dynamics {
      \global
      \editorial.above.A
      \editorial.above.B
      \editorial.above.C
      \editorial.above.D
      \editorial.above.E
      \editorial.above.A′
      \editorial.above.C′
    }
    \new Staff = "up" {
      \global
      \upper.A
      \upper.B
      \upper.C
      \bar "||"
      \upper.D
      \bar "||"
      \upper.E
      \upper.A′
      \upper.C′
      \bar "|."
    }
    \new Dynamics {
      \global
      \editorial.between.A
      \editorial.between.B
      \editorial.between.C
      \editorial.between.D
      \editorial.between.E
      \editorial.between.A′
      \editorial.between.C′
    }
    \new Staff = "down" {
      \global
      \lower.A
      \lower.B
      \lower.C
      \lower.D
      \lower.E
      \lower.A′
      \lower.C′
    }
    \new Dynamics {
      \global
      \editorial.below.A
      \editorial.below.B
      \editorial.below.C
      \editorial.below.D
      \editorial.below.E
      \editorial.below.A′
      \editorial.below.C′
    }
    \new Dynamics {
      \global
      \breaks_mine
    }
  >>
}
