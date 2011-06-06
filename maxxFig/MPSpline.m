function [ tTopoMap, tChX, tChY ] = MPSpline( tChData, tDataType, tNetType, tChanMask )% function [ tTopoMap, tChX, tChY ] = MPSpline( tChData, tDataType, tNetType, tChanMask )% Parameters:% 	tChData:	the 128-channel scalp potential/amplitude vector % 	tDataType:	'Time' | 'Freq';% 	tNetType:	'HCN' | 'GSN'%	tChanMask:	a 128-channel logical subscript for masking out certain channels% Return values:% 	tTopoMap:	The maxtrix of topomap data suitable for imaging% 	tChX, tChY:	coordinates of selected net type channel positions in tTopoMap's ref.frametChPos = ChPos( tNetType );tChX = tChPos( tChanMask, 1 );tChY = tChPos( tChanMask, 2 );tNCh = size( tChPos, 1 );tDF = 50; % density factortNGP = round( sqrt( tDF * tNCh * 4 / pi ) ); % number of grid points (per side)[ tX, tY ] = meshgrid( linspace( 0, 1.0, tNGP ) );tY = flipud( tY );tTopoMap = griddata( tChX, tChY, tChData( tChanMask ), tX, tY, 'cubic' );tChX = round( ( tNGP - 1 ) * tChPos( tChanMask, 1 ) ) + 1;tChY = round( ( tNGP - 1 ) * tChPos( tChanMask, 2 ) ) + 1;tChY = tNGP - tChY + 1;function tChPos = ChPos( tNetType )if strcmp( tNetType, 'HCN' )	tChPos = ChPosHCN;else % implicitly...	tChPos = ChPosGSN;endfunction tChPos = ChPosHCN()% obtained by uncommenting code at bottom of VESchemeHCN_128::BuildVectorXYtChPos = [ ...% 0 0.5 0.5; ...55 0.5 0.4375; ...80 0.559441 0.480686; ...106 0.536737 0.550564; ...7 0.463263 0.550564; ...31 0.440559 0.480686; ...79 0.573473 0.398873; ...87 0.618882 0.461373; ...105 0.618882 0.538627; ...112 0.573473 0.601127; ...6 0.5 0.625; ...13 0.426527 0.601127; ...30 0.381118 0.538627; ...37 0.381118 0.461373; ...54 0.426527 0.398873; ...62 0.5 0.3125; ...78 0.576263 0.32871; ...86 0.63934 0.374538; ...93 0.678323 0.442059; ...104 0.686473 0.519599; ...111 0.66238 0.59375; ...118 0.61021 0.651691; ...5 0.538983 0.683403; ...12 0.461017 0.683403; ...20 0.38979 0.651691; ...29 0.33762 0.59375; ...36 0.313527 0.519599; ...42 0.321677 0.442059; ...53 0.36066 0.374538; ...61 0.423737 0.32871; ...72 0.5 0.25; ...77 0.577254 0.262236; ...85 0.646946 0.297746; ...92 0.702254 0.353054; ...98 0.737764 0.422746; ...103 0.75 0.5; ...110 0.737764 0.577254; ...117 0.702254 0.646946; ...124 0.646946 0.702254; ...4 0.577254 0.737764; ...11 0.5 0.75; ...19 0.422746 0.737764; ...24 0.353054 0.702254; ...28 0.297746 0.646946; ...35 0.262236 0.577254; ...41 0.25 0.5; ...47 0.262236 0.422746; ...52 0.297746 0.353054; ...60 0.353054 0.297746; ...67 0.422746 0.262236; ...76 0.547321 0.201224; ...84 0.637332 0.230471; ...91 0.7139 0.2861; ...97 0.769529 0.362668; ...102 0.798776 0.452679; ...109 0.798776 0.547321; ...116 0.769529 0.637332; ...123 0.7139 0.7139; ...3 0.638901 0.772608; ...10 0.567774 0.803205; ...16 0.5 0.8125; ...18 0.432226 0.803205; ...23 0.361099 0.772608; ...27 0.2861 0.7139; ...34 0.230471 0.637332; ...40 0.201224 0.547321; ...46 0.201224 0.452679; ...51 0.230471 0.362668; ...59 0.2861 0.2861; ...66 0.362668 0.230471; ...71 0.452679 0.201224; ...75 0.5 0.1575; ...83 0.605838 0.174263; ...90 0.701316 0.222912; ...96 0.777088 0.298684; ...101 0.825737 0.394162; ...108 0.8425 0.5; ...115 0.825737 0.605838; ...122 0.777088 0.701316; ...2 0.703 0.779406; ...9 0.611906 0.844411; ...15 0.5 0.8725; ...22 0.388094 0.844411; ...26 0.297 0.779406; ...33 0.222912 0.701316; ...39 0.174263 0.605838; ...45 0.1575 0.5; ...50 0.174263 0.394162; ...58 0.222912 0.298684; ...65 0.298684 0.222912; ...70 0.394162 0.174263; ...82 0.559054 0.127148; ...89 0.671381 0.163645; ...95 0.766933 0.233067; ...100 0.836355 0.328619; ...114 0.872852 0.559054; ...121 0.836355 0.671381; ...1 0.766933 0.766933; ...8 0.673891 0.84128; ...14 0.561318 0.887146; ...21 0.438682 0.887146; ...25 0.326109 0.84128; ...32 0.233067 0.766933; ...38 0.163645 0.671381; ...44 0.127148 0.559054; ...57 0.163645 0.328619; ...64 0.233067 0.233067; ...69 0.328619 0.163645; ...74 0.440946 0.127148; ...81 0.5 0.09; ...88 0.626697 0.110067; ...94 0.740992 0.168303; ...99 0.831697 0.259008; ...107 0.889933 0.373303; ...113 0.91 0.5; ...120 0.889933 0.626697; ...125 0.831697 0.740992; ...126 0.740992 0.831697; ...17 0.5 0.94; ...127 0.259008 0.831697; ...128 0.168303 0.740992; ...43 0.110067 0.626697; ...49 0.09 0.5; ...56 0.110067 0.373303; ...63 0.168303 0.259008; ...68 0.259008 0.168303; ...73 0.373303 0.110067; ...119 0.941991 0.570004; ...48 0.0580095 0.570004; ...% 129 0.5 0.5; ...];[ tY, tYI ] = sort( tChPos( :, 1 ) );tChPos = tChPos( tYI, 2:3 );function tChPos = ChPosGSN()% obtained by uncommenting code at bottom of VESchemeGSN_128::BuildVectorXYtChPos = [ ...% 0 0.5 0.5; ...55 0.5 0.4375; ...81 0.559441 0.480686; ...107 0.536737 0.550564; ...7 0.463263 0.550564; ...32 0.440559 0.480686; ...62 0.5 0.375; ...80 0.573473 0.398873; ...88 0.618882 0.461373; ...106 0.618882 0.538627; ...113 0.573473 0.601127; ...6 0.5 0.625; ...13 0.426527 0.601127; ...31 0.381118 0.538627; ...38 0.381118 0.461373; ...54 0.426527 0.398873; ...68 0.5 0.3125; ...79 0.576263 0.32871; ...87 0.63934 0.374538; ...94 0.678323 0.442059; ...105 0.686473 0.519599; ...112 0.66238 0.59375; ...119 0.61021 0.651691; ...5 0.538983 0.683403; ...12 0.461017 0.683403; ...21 0.38979 0.651691; ...30 0.33762 0.59375; ...37 0.313527 0.519599; ...43 0.321677 0.442059; ...53 0.36066 0.374538; ...61 0.423737 0.32871; ...73 0.5 0.25; ...78 0.577254 0.262236; ...86 0.646946 0.297746; ...93 0.702254 0.353054; ...99 0.737764 0.422746; ...104 0.75 0.5; ...111 0.737764 0.577254; ...118 0.702254 0.646946; ...124 0.646946 0.702254; ...4 0.577254 0.737764; ...11 0.5 0.75; ...20 0.422746 0.737764; ...25 0.353054 0.702254; ...29 0.297746 0.646946; ...36 0.262236 0.577254; ...42 0.25 0.5; ...48 0.262236 0.422746; ...52 0.297746 0.353054; ...60 0.353054 0.297746; ...67 0.422746 0.262236; ...77 0.546576 0.19099; ...85 0.635589 0.218447; ...92 0.712554 0.270921; ...98 0.770633 0.34375; ...103 0.804665 0.430462; ...110 0.811626 0.523353; ...117 0.790898 0.614169; ...123 0.744322 0.694841; ...3 0.676038 0.7582; ...10 0.592111 0.798617; ...16 0.5 0.8125; ...19 0.407889 0.798617; ...24 0.323962 0.7582; ...28 0.255678 0.694841; ...35 0.209102 0.614169; ...41 0.188374 0.523353; ...47 0.195335 0.430462; ...51 0.229367 0.34375; ...59 0.287446 0.270921; ...66 0.364411 0.218447; ...72 0.453424 0.19099; ...76 0.5 0.145; ...84 0.604638 0.160772; ...91 0.699979 0.206685; ...97 0.77755 0.278661; ...102 0.83046 0.370304; ...109 0.854007 0.473471; ...116 0.846099 0.578995; ...122 0.807439 0.6775; ...2 0.741461 0.760233; ...9 0.654029 0.819844; ...15 0.55291 0.851035; ...18 0.44709 0.851035; ...23 0.345971 0.819844; ...27 0.258539 0.760233; ...34 0.192561 0.6775; ...40 0.153901 0.578995; ...46 0.145993 0.473471; ...50 0.16954 0.370304; ...58 0.22245 0.278661; ...65 0.300021 0.206685; ...71 0.395362 0.160772; ...83 0.558499 0.111884; ...90 0.670299 0.14637; ...96 0.766968 0.212277; ...101 0.839915 0.30375; ...115 0.891402 0.529332; ...121 0.865368 0.643396; ...1 0.806869 0.74472; ...8 0.721103 0.824299; ...14 0.615691 0.875062; ...22 0.384309 0.875062; ...26 0.278897 0.824299; ...33 0.193131 0.74472; ...39 0.134632 0.643396; ...45 0.108598 0.529332; ...57 0.160085 0.30375; ...64 0.233032 0.212277; ...70 0.329701 0.14637; ...75 0.441501 0.111884; ...82 0.5 0.08; ...89 0.623797 0.0986594; ...95 0.736594 0.15298; ...100 0.828369 0.238134; ...108 0.890967 0.346557; ...114 0.918826 0.468613; ...120 0.90947 0.593459; ...125 0.863731 0.71; ...126 0.785673 0.807882; ...17 0.5 0.92; ...127 0.214327 0.807882; ...128 0.136269 0.71; ...44 0.0905303 0.593459; ...49 0.0811744 0.468613; ...56 0.109033 0.346557; ...63 0.171631 0.238134; ...69 0.263406 0.15298; ...74 0.376203 0.0986594; ...% 129 0.5 0.5; ...];[ tY, tYI ] = sort( tChPos( :, 1 ) );tChPos = tChPos( tYI, 2:3 );