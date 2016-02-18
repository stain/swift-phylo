swift-phylo
===========

Workflow for Phylogenetic Analysis using the Swift parallel scripting system.

Reference: Ocaña, Kary ACS, et al. "Sciphy: A cloud-based workflow for phylogenetic analysis of drug targets in protozoan genomes." Advances in Bioinformatics and Computational Biology. Springer Berlin Heidelberg, 2011. 66-70.

Requirements
============

This uses the tools:

- mafft: http://mafft.cbrc.jp/alignment/software/
- raxml: http://sco.h-its.org/exelixis/web/software/raxml/index.html
- Swift: http://swift-lang.org/main/ (installation guide, documentation, downloads and general information about the Swift parallel scripting language)
- Python (version => 2.5)

You can install the required programs and scripts from swift-phylo by running:

- > sudo apt-get update
- > sudo apt-get install raxml
- > sudo apt-get install mafft
- > export SWIFT_PHYLO=/path/to/swift-phylo/bin

Workflow invocation
===================

Run the following command in the directory where the input files are placed:

$ swift -config swift.conf swiftPhylo.swift


