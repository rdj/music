\version "2.20.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  indent = 0
  print-page-number = ##f
}

\header {
  title = "Maple Leaf Rag"
  composer = "Scott Joplin"
  opus = "1899"
  tagline = ##f
}

%% This piece is in Ab major with overall structure:
%%    AABBACCDD
%%
%% The C section is in Db and is labeled "Trio".

A_UPPER_PICKUP = {
  \partial 8
  r8 |
}

A_UPPER = {
  \stemDown
  r16 af <ef ef'> af c <ef ef,>8 g,16 |
  <ef ef'> g bf <ef, ef'>~ q4 |
  r16 af <ef ef'> af c <ef ef,>8 g,16 |
  <ef ef'> g bf <ef, ef'>~ q8 r16 q |
  \break

  r af cf <ff ff,> r <ef, ef'> r q |
  r af cf <ff ff,> r <ef, ef'> r8 |
  s2 |
  r16 af^( cf af') r af^( cf af') |
  \break

  <af af,>8 q q q16 q~ |
  q ef f c ef <f af,>8 <af, ff>16~ |
  <af ff!> bf <cf ff,> af bf <c ef,>8 af16 |
  <c ef,> af <bf ef,>8 <af ef>[ r16 <af af,>]~ |
  \break

  q8 q q q16 q~ |
  q ef <f af,> c ef <f af,>8 <af, ff>16~ |
  \stemNeutral
  <af ff!> bf <cf ff,> af bf <c ef,>8 af16 |
}

A_UPPER_FIRST = {
  <c ef,>16 af <bf ef,>8 <af ef> r |
}

A_UPPER_SECOND = {
  <c ef,>16 af <bf ef,>8 <af ef> r |
}

A_UPPER_THIRD = {
  <c ef,>16 af <bf ef,>8 <af ef> <af af'> |
}

A_LOWER_PICKUP = {
  <ef ef,>8 |
}

lh = \markup { \tiny \italic "l. h." }
rh = \markup { \tiny \italic "  r. h." }

A_LOWER = {
  <af af,>8 <c af ef> q <a a,> |
  <bf bf,> <df g, ef> q <ef, ef,> |
  <af af,>8 <c af ef> q <a a,> |
  <bf bf,> <df g, ef> q <ef, ef,> |

  <ff ff,>4 <ef ef,>8 q |
  <ff ff,>4 <ef ef,>8 r8 |
  <<
    \relative af, { df16\rest af_(^\rh cf af') r16 af_(^\rh cf af') } \\
    \relative af, { af,8^\lh r af'^\lh r }
  >> |
  af8 r af' r |

  \clef treble
  \relative c'' {
    <b af f d> q q q |
    <c af ef> q q q |
    <cf af ff> q <c af ef> q |
    q <df g, ef> <c af> r |
  }

  \clef bass
  <b, af f d> q q q |
  <c af ef> q q q |
  <cf af ff> q <c af ef> q |
}

A_LOWER_FIRST = {
  <c af ef>8 <df g, ef> <c af> <ef, ef,> |
}

A_LOWER_SECOND = {
  <c' af ef>8 <df g, ef> <c af> <a a,> |
}

A_LOWER_THIRD = {
  <c af ef>8 <df g, ef> <c af> r |
}

A_DYNAMICS = {
  s16\f s16 s4. |
  \repeat unfold 5 s2
  s16\p s16 s4. |
  s2 |
  s8\mf\< s4. |
  s32 s32\! s16 r4. |
  \repeat unfold 5 s2
}

A_DYNAMICS_FIRST_SECOND_THIRD = {
  s2
}

B_UPPER = {
  \stemDown
  r16 g' <ef ef'> g bf <d d,>8 g,16 |
  <df! df'!> g bf <c c,>~ q ef, <bf bf'> ef |
  r c <af af'> c ef <f f,>8 c16 |
  <af af'> c ef <f f,>~ q c <f f,>8 |
  r16 ef <g, g'> bf df <f f,>8 ef16 |
  \break

  <g, g'> bf df <f f,>~ q df <f f,>8 |
  r16 c <af af'> c ef <f f,>8 c16 |
  <af af'> c ef <f f,>~ q c <f f,>8 |
  r16 g <ef ef'> g bf <d, d'>8 g16 |
  <df! df'!> g bf <c, c'>~ q ef <bf bf'> ef |
  r c <af af'> c ef <f f,>8 c16 |
  \break

  <af af'>8 q <g g'> <gf gf'> |
  \stemUp
  r16 f a c f c a f |
  r16 f bf df <f f,>8 <df bf f> |
  <c af f d>[ r16 q] r <bf df,>8 ef,16 |
}

B_UPPER_FIRST = {
  <af c,>8 <ef ef'> q q |
}

B_UPPER_SECOND = {
  \stemDown
  r16 af c ef <af, af'>8 r |
  \break
}

B_LOWER = {
  <bf bf,>8 <df g, ef> <ef, ef,> <df' g, ef> |
  <bf bf,>8 <df g, ef> <ef, ef,> <g g,> |
  <af af,> <c af ef> <ef, ef,> <c' af ef> |
  <af af,> <c af ef> <af af,> <a a,> |
  <bf bf,> <df g, ef> <ef, ef,> <df' g, ef> |

  <bf bf,> <df g, ef> <bf bf,> <b b,> |
  <c c,> <c af ef> <ef, ef,> <c' af ef> |
  <af af,> <c af ef> <af af,> <a a,> |
  <bf bf,> <df g, ef> <ef, ef,> <df' g, ef> |
  <bf bf,> <df g, ef> <ef, ef,> <g g,> |
  <af af,> <c af ef> <ef, ef,> <c' af ef> |

  <af af,> q <g g,> <gf gf,> |
  <f f,> q <a a,> q |
  <bf bf,> <df bf f> q q |
  <bf f bf,> q <ef, ef,> <g g,> |
}

B_LOWER_FIRST = {
  <af af,> <c af ef> q <a a,> |
}

B_LOWER_SECOND = {
  <af af,> <ef' c af> q <ef, ef,> |
}

B_DYNAMICS = {
  s16\f s16^\markup{ \italic "stacc." } s4. |
  \repeat unfold 16 s2
}

C_UPPER = {
  <af' ef c af>8. <af ef c bf>16~ q <ef c> bf8 |
  <af' ef c af>8. <af ef c bf>16~ q <ef c> bf <ef c> |
  af, df bf df f af, df f |
  bf, df f af,~ af f' bf, f' |
  <af ef c af>8. <af ef c bf>16~ q <ef c> bf8 |
  \break

  <af' ef c af>8. <af ef c bf>16~ q <ef c> bf <ef c> |
  af, df bf df f af, df f |
  bf, df f af,~ af f' a, <f' ef> |
  <f d bf bf'>8. <f d c bf'>16~ q <f d> c8 |
  <f d bf bf'>8. <f d c bf'>16~ q <f d> c <f d> |
  r ef <bf bf'> ef gf <c c,>8 ef,16 |
  \break

  <bf bf'> ef gf <c c,>~ q ef, <bf bf'>8 |
  <df ff df'> q <c ff c'> <bf ff' bf> |
  <f'! af,>16 df ef <gf bf,>~ q bf, <f' af,>8 |
  <f g,>16 df ef <f gf,> ~ q c <ef gf,> <df f,>~ |
}

C_UPPER_FIRST = {
  <df f,> <af' af,>8 f16 <af af,> f <af af,> f |
}

C_UPPER_SECOND = {
  <df f,>\repeatTie df f af <df df,>8 r |
  \break
}

C_LOWER = {
  <ef, ef,>8 <af c gf'> <gf gf,> <af c gf'> |
  <f f,> <af c gf'> <ef ef,> <c c,> |
  <df df,> <af' df f> <af af,> <af df f> |
  <f f,> <af df f> <df, df,> <d d,> |
  <ef ef,> <af c gf'> <gf gf,> <af c gf'> |

  <f f,> <af c gf'> <ef ef,> <c c,> |
  <df df,> <af' df f> <af af,> <af df f> |
  <f f,> <af df f> <df, df,> <c c,> |
  <bf bf,> <bf' d af'> <d, d,> <bf' d af'> |
  <f f,> <bf d af'> <bf bf,> <bf d af'> |
  <ef, ef,> <bf' ef gf> <gf gf,> <bf ef gf> |

  <ef, ef,> <bf' ef gf> <gf gf,> <bf ef gf> |
  g16 bf8 df16 ff df bf g |
  <af af,>8 <af df f!> bf, <af' bf d> |
  <df! bf ef,> q <c af> q |
}

C_LOWER_FIRST = {
  <df df,> <f df af> q <d, d,> |
}

C_LOWER_SECOND = {
  <df' df,> <af af,> <df, df,> <c' c,> |
}

D_UPPER = {
  <af af,>8 <f af,> <af af,> <f af,> |
  <af f> <bf f>16 <c f,>~ q bf af f |
  ef f8 <c af>16~ q4 |
  r16 ef <f af,> c ef <f af,>8 c16 |
  <ef g,>8 f16 <bf, g>~ q4 |
  \break

  r16 df <f g,> bf, df <f g,>8 <c af>16~ |
  q ef <f af,> c ef <f af,>8 <c af>16~ |
  q ef <f af,> c ef <f af,>8 ef16 |
  <af af,>8 <f af,> <af af,> <f af,> |
  <af f> <bf f>16 <c f,>~ q bf af f |
  af8 f ef16 af8 <c, af>16~ |
  \break

  q ef <f af,> c ef <f af,>8 <af, f>16~ |
  q bf <af f>8 <af ff> <bf ff>16 <af ef>~ |
  q bf <c ef,> af bf <c ef,>8 <af d,>16~ |
  <af d,!> bf <c d,> af r <bf df,>8 ef,16 |
}

D_UPPER_FIRST = {
  <af c,>8 <ef ef'> q q |
}

D_UPPER_SECOND = {
  <af c,>8 <g df' ef> <af c ef af>
}

D_LOWER = {
  <df df,>8 <f df af> q <c c,> |
  <df df,> <f df af> <bf, bf,> <b b,> |
  <c c,> <ef c af> q <ef, ef,> |
  <af af,> <c af ef> <ef, ef,> <a a,> |
  <bf bf,> <df g, ef> <ef, ef,> <a a,> |

  <bf bf,> <df g, ef> <ef, ef,> <g g,> |
  <af af,> <c af ef> <ef, ef,> <c' af ef> |
  <af af,> <c af ef> <bf bf,> <c c,> |
  <df df,> <f df af> q <c c,> |
  <df df,> <f df af> <bf, bf,> <b b,> |
  <c c,> <ef c af> q <c, c,> |

  <af' af,> <c af ef> <ef, ef,> <c' af ef> |
  <df, df,> q <bf bf,> <d d,> |
  <ef ef,> <ef af c> <ef ef,> <e e,> |
  <f f,> q <g g,> q |
}

D_LOWER_FIRST = {
  <af af,> <c af ef> <bf bf,> <c c,> |
}

D_LOWER_SECOND = {
  <af af,> <ef ef,> <af, af,>
}

global = {
  \key af \major
  \time 2/4
}

trio = {
  \key df \major
}

dsec = {
  \key af \major
}

\score {
  \new PianoStaff <<
    \new Staff = "upper" {
      \clef treble
      \tempo "Tempo di marcia"
      \global
      \relative c'' {
        \A_UPPER_PICKUP
        \repeat volta 2 {
          \A_UPPER
        }
        \alternative {
          \A_UPPER_FIRST
          \A_UPPER_SECOND
        }
        \bar ".|:-||" \break
        \repeat volta 2 {
          \B_UPPER
        }
        \alternative {
          \B_UPPER_FIRST
          \B_UPPER_SECOND
        }
        \bar "||" \break
        \A_UPPER
        \A_UPPER_THIRD
        \trio
        \bar ".|:-||" \break
        \mark "Trio"
        \repeat volta 2 {
          \C_UPPER
        }
        \alternative {
          \C_UPPER_FIRST
          \C_UPPER_SECOND
        }
        \dsec
        \bar ".|:-||" \break
        \repeat volta 2 {
          \D_UPPER
        }
        \alternative {
          \D_UPPER_FIRST
          \D_UPPER_SECOND
        }
        \bar "|."
      }
    }
    \new Dynamics {
      \global
      r8 |
      \A_DYNAMICS
      \A_DYNAMICS_FIRST_SECOND_THIRD
      \A_DYNAMICS_FIRST_SECOND_THIRD
      \B_DYNAMICS
      \A_DYNAMICS
      \A_DYNAMICS_FIRST_SECOND_THIRD
      % No dynamics for remainder of piece
    }
    \new Staff = "lower" {
      \clef bass
      \global
      \relative c {
        \A_LOWER_PICKUP
        \A_LOWER
        \A_LOWER_FIRST
        \A_LOWER_SECOND
        \B_LOWER
        \B_LOWER_FIRST
        \B_LOWER_SECOND
        \A_LOWER
        \A_LOWER_THIRD
        \trio
        \C_LOWER
        \C_LOWER_FIRST
        \C_LOWER_SECOND
        \dsec
        \D_LOWER
        \D_LOWER_FIRST
        \D_LOWER_SECOND
      }
    }
  >>
}
