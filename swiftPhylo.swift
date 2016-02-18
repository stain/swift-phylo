type file;

#string ortho[];

file fasta[] <filesys_mapper; pattern="ORTHO*">;
file fastaNumbered[] <simple_mapper;suffix=".fastaNumbered">;	
file mafft[] <simple_mapper; suffix=".mafft">;
file phylip[] <simple_mapper; suffix=".phylip">;
file mg[] <simple_mapper; suffix=".mg">;

file mfMG[] <simple_mapper; suffix=".mg.modelFromMG.txt">;
file modelMGBateRaxml[] <simple_mapper; suffix=".phylip.modelMGBateRaxml.txt">;

file r1[] <simple_mapper; prefix="RAxML_bestTree.", suffix=".phylip_raxml_tree1.singleTree">;
file r2[] <simple_mapper; prefix="RAxML_bipartitionsBranchLabels.", suffix=".phylip_tree3.BS_TREE">;
file r3[] <simple_mapper; prefix="RAxML_bipartitions.", suffix=".phylip_tree3.BS_TREE">;
file r4[] <simple_mapper; prefix="RAxML_bootstrap.", suffix=".phylip_tree2.raxml">;
file r5[] <simple_mapper; prefix="RAxML_info.", suffix=".phylip_raxml_tree1.singleTree">;
file r6[] <simple_mapper; prefix="RAxML_info.", suffix=".phylip_tree2.raxml">;
file r7[] <simple_mapper; prefix="RAxML_info.", suffix=".phylip_tree3.BS_TREE">;
file r8[] <simple_mapper; prefix="RAxML_log.", suffix=".phylip_raxml_tree1.singleTree">;
file r9[] <simple_mapper; prefix="RAxML_parsimonyTree.", suffix=".phylip_raxml_tree1.singleTree">;
file r10[] <simple_mapper; prefix="RAxML_result.", suffix=".phylip_raxml_tree1.singleTree">;


app (file o) fastanumbered (file f) 
{
	fastaNumbered filename(f) stdout=filename(o);
}

app (file o) mafft (file f)
{
	mafft filename(f) stdout=filename(o);
}

app (file o) readseq (file i)
{	
	readseq filename(i) filename(o);
}

app (file o) modelgenerator (file i)
{
	modelgenerator filename(i) stdout=filename(o);
}

app (file o) cleanModelgenerator(file i)
{
	cleanModelgenerator filename(i);
}

app (file o1, file o2, file o3, file o4, file o5, file o6, file o7, file o8, file o9, file o10) raxml (file phylip, file mg)
{
	raxml filename(phylip) filename(mg) "2" "4";
}

foreach f, i in fasta
{
	fastaNumbered[i] = fastanumbered(fasta[i]);
	mafft[i] = mafft(fastaNumbered[i]);
	phylip[i] = readseq(mafft[i]);
	mg[i] = modelgenerator(phylip[i]);	
	mfMG[i] = cleanModelgenerator(mg[i]);
	(r1[i], r2[i], r3[i], r4[i], r5[i], r6[i], r7[i], r8[i], r9[i], r10[i]) = raxml(phylip[i], mfMG[i]);
}


