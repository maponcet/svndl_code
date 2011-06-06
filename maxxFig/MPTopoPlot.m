function tH = MPTopoPlot( tChData, tDataType, tSigIndx, tLabels, tNetType, tChanMask, varargin )% function MPTopoPlot( tChData, tPlotType, tDataType, tSigIndx, tLabels, tNetType )% tChData:		the 128-channel scalp potential/amplitude vector % tDataType:	'Time' | 'Freq';% tSigIndx:		significant channel indices; 128x1 logical index vector% tLabels:		'LabelsOn' | 'LabelsOff'; channel labels% tNetType:		'HCN' | 'GSN'% tChanMask:	a 128-channel logical subscript for masking out certain channels (passed on to MPSpline)% varargin:		tMx, tMn: optional manual extrema for z-scale% tXMx, tYMx:	coordinates of global maximum% v1 = v0 +	reorganized calling chain so plotting is separate from interpolation%			make MPSpline a separately accessible function%			eliminate daisy option%			pass figure handle back to caller[ tTopoMap, tChX, tChY ] = MPSpline( tChData, tDataType, tNetType, tChanMask );tH = mpimage( tTopoMap, tDataType, varargin{:} );% Optionally plot significant channels, optionally with labelshold on;plot( tChX( tSigIndx ), tChY( tSigIndx ), 'k.', 'markersize', 18, 'color', [ 0 0 0 ] );if strcmp( tLabels, 'LabelsOn' )	tChI = [ 1:128 ];	for iCh = tChI( tSigIndx );		text( tChX( iCh ), tChY( iCh ), num2str( iCh ), 'color', [ 1 1 1 ] );	endendfunction tH = mpimage( tImage, tDataType, varargin )%function mpimage( tImage )figure;tNC = 200; % number of colorsswitch tDataType	case 'Freq',		tCMap = hot( tNC );	case 'Time',		tCMap = zeros( 200, 3 );		tCMap( 134:end, 1 ) = linspace( .5, 1, 67 )';		tCMap( 1:67, 3 ) = linspace( 1, .5, 67 )';		tCMap( [ 1:67 ] + 67, : ) = 0.5 * ones( 67, 3 );	case 'RGB',		tCMap = hsv( 1.5 * tNC );		tCMap = fliplr( tCMap( 1:tNC, : ) );	otherwise % 'gray',		tCMap = gray( tNC );endimage( tImage, 'CDataMapping', 'scaled' ); % by default, vertical invert; enable scaled color mapping% Extend the color range beyond the extrema of data range to create % head/floor-room for CMap entries that denote significanceif( nargin > 2 )	tMx = varargin{ 1 };	tMn = varargin{ 2 };else	tMx = max( max( tImage ) );	tMn = min( min( tImage ) );endtMInc = ( tMx - tMn ) / tNC;set( gca, 'CLim', [  tMn - 2*tMInc tMx + 2*tMInc ] );% add the white entries to the extrema of the CMaptCMap = [ [ 0 0 0 ]; tCMap; [ 1 1 1 ] ];colormap( tCMap );axis image;axis off;tH = gcf;