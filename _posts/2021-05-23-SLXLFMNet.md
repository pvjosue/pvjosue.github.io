---
title: "Real-Time Light Field 3D Microscopy via Sparsity-Driven Learned Deconvolution"
collection: publications
date: 2021-05-23
venue: '2021 IEEE International Conference on Computational Photography (ICCP)'
citation: '@INPROCEEDINGS{9466256,
  author={Vizcaino, Josue Page and Wang, Zeguan and Symvoulidis, Panagiotis and Favaro, Paolo and Guner-Ataman, Burcu and Boyden, Edward S. and Lasser, Tobias},
  booktitle={2021 IEEE International Conference on Computational Photography (ICCP)}, 
  title={Real-Time Light Field 3D Microscopy via Sparsity-Driven Learned Deconvolution}, 
  year={2021},
  volume={},
  number={},
  pages={1-11},
  doi={10.1109/ICCP51581.2021.9466256}}'
---

 [[PDF]](https://cvg.unibe.ch/media/publications/pdf/053.pdf) 
 [[Project Page]](https://github.com/pvjosue/SLNet_XLFMNet) [[Code]](https://github.com/pvjosue/SLNet_XLFMNet) 

## Abstract

Light Field Microscopy (LFM) is a scan-less 3D imaging technique capable of capturing fast biological processes, such as neural activity in zebrafish. However, current methods to recover a 3D volume from the raw data require long reconstruction times hampering the usability of the microscope in a closed-loop system. Moreover, because the main focus of zebrafish brain imaging is to isolate and study neural activity, the ideal volumetric reconstruction should be sparse to reveal the dominant signals. Unfortunately, current sparse decomposition methods are computationally intensive and thus introduce substantial delays. This motivates us to introduce a 3D reconstruction method that recovers the spatio-temporally sparse components of an image sequence in real-time. In this work we propose a combination of a neural network (SLNet) that recovers the sparse components of a light field image sequence and a neural network (XLFMNet) for 3D reconstruction. In particular, XLFMNet is able to achieve high data fidelity and to preserve important signals, such as neural potentials, even on previously unobserved samples. We demonstrate successful sparse 3D volumetric reconstructions of the neural activity of live zebrafish, with an imaging span covering 800×800×250μm 3 at an imaging rate of 24 - 88Hz, which provides a 1500 fold speed increase against prior work and enables real-time reconstructions without sacrificing imaging resolution.
