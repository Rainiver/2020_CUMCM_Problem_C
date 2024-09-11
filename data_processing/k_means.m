opts = statset('Display','final');
idx = kmeans(zscore(f),4,"distance",'cityblock','replicates',100,'options',opts);