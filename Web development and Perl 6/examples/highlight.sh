CSSPATH=$(dirname $0)
for F in *.pl6; do vim -c TOhtml -c wqa $F && mv $F.html $F.html.orig && head -n10 $F.html.orig > $F.html && echo '<link rel="stylesheet" type="text/css" href="'$CSSPATH'/syntax.css">' >> $F.html && tail -n+30 $F.html.orig >> $F.html && rm $F.html.orig ; done
