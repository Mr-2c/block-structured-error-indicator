function [  RSeq_convProdTurbTrans , ...
            RSeq_altConvProdTurbTrans , ...
            RSeq_allPressure , ...
            modRSeq_allPressure , ...
            RSeq_allViscous , ...
            RSeq_diff2zero , ...
            RSeq_diff2zeroAlt ] = ...
OF_BFS_RSeq_nonlin_v110( ...
            RSeq_tmp_convProdTurbTrans , ...
            RSeq_tmp_altConvProdTurbTrans , ...
            RSeq_tmp_allPressure , ...
            modRSeq_tmp_allPressure , ...
            RSeq_tmp_allViscous , ...
            UiDtauJKdxK , ...
            Vars , ...
            divUiUj , ...
            skewSymmetric , ...
            gradP , ...
            gradModP , ...
            laplacianUi )

%%
RSeq_convProdTurbTrans      = nonlin2vvA_v100( RSeq_tmp_convProdTurbTrans       , Vars(:,1:3,:)    , divUiUj ) ; 
RSeq_altConvProdTurbTrans   = nonlin2vvA_v100( RSeq_tmp_altConvProdTurbTrans    , Vars(:,1:3,:)    , skewSymmetric ) ; 
RSeq_allViscous             = nonlin2vvA_v100( RSeq_tmp_allViscous              , Vars(:,1:3,:)    , laplacianUi ) ;
RSeq_allPressure            = nonlin2vvA_v100( RSeq_tmp_allPressure             , Vars(:,1:3,:)    , gradP ) ;
modRSeq_allPressure         = nonlin2vvA_v100( modRSeq_tmp_allPressure          , Vars(:,1:3,:)    , gradModP ) ;

%%
% RSeq_diff2zero         = RSeq_tmp_diff2zero - ...
%                                 ( RSeq_convProdTurbTrans ...
%                                 - RSeq_allPressure ...
%                                 - RSeq_allViscous ...
%                                 - UiDtauJKdxK ) ;
RSeq_diff2zero       	= RSeq_convProdTurbTrans ...
                        - RSeq_allPressure ...
                        - RSeq_allViscous ...
                        + UiDtauJKdxK ;
      
RSeq_diff2zeroAlt       = RSeq_altConvProdTurbTrans ...
                        - RSeq_allPressure ...
                        - RSeq_allViscous ...
                        + UiDtauJKdxK ;
                    
%%
RSeq_convProdTurbTrans      = RSeqSymmetrizer_vec_v100( RSeq_convProdTurbTrans );
RSeq_altConvProdTurbTrans   = RSeqSymmetrizer_vec_v100( RSeq_altConvProdTurbTrans );
RSeq_allViscous             = RSeqSymmetrizer_vec_v100( RSeq_allViscous );
RSeq_diff2zero              = RSeqSymmetrizer_vec_v100( RSeq_diff2zero );
RSeq_diff2zeroAlt           = RSeqSymmetrizer_vec_v100( RSeq_diff2zeroAlt );
RSeq_allPressure            = RSeqSymmetrizer_vec_v100( RSeq_allPressure );
modRSeq_allPressure         = RSeqSymmetrizer_vec_v100( modRSeq_allPressure );  
