
cd ..

# g++ ./src/search_hnsw.cpp -O3 -o ./src/search_hnsw -I ./src
# g++ ./src/search_hnsw.cpp -O3 -o ./src/search_hnsw -I ./src -march=native
# g++ ./src/search_hnsw.cpp -O3 -o ./src/search_hnsw -I ./src -ffast-math -march=native
g++ ./src/search_hnsw.cpp -O3 -o ./src/search_hnsw -I ./src -ffast-math -march=native -fopenmp
# g++ ./src/search_hnsw.cpp -O3 -o ./src/search_hnsw -I ./src -lprofiler
# path=./data/
# result_path=./results/

# data='gist'
# ef=500
# M=16
# k=20

# for randomize in {0..2}
# do
# if [ $randomize == "1" ]
# then 
#     echo "HNSW++"
#     index="${path}/${data}/O${data}_ef${ef}_M${M}.index"
# elif [ $randomize == "2" ]
# then 
#     echo "HNSW+"
#     index="${path}/${data}/O${data}_ef${ef}_M${M}.index"
# else
#     echo "HNSW"
#     index="${path}/${data}/${data}_ef${ef}_M${M}.index"    
# fi

# res="${result_path}/${data}_ef${ef}_M${M}_${randomize}.log"
# query="${path}/${data}/${data}_query.fvecs"
# gnd="${path}/${data}/${data}_groundtruth.ivecs"
# trans="${path}/${data}/O.fvecs"

# ./src/search_hnsw -d ${randomize} -n ${data} -i ${index} -q ${query} -g ${gnd} -r ${res} -t ${trans} -k ${k}
cd src
# ./search_hnsw

dataset=glove-100

# for i in {4..11}
#     do
#     shuf_str="_shuf${i}"
#     for recall in 0.86
#     do
#         for k in 50
#         do
#             echo "recall=${recall}, k=${k}, shuf=${shuf_str}"
#             # nohup \
#             ./search_hnsw -r ${recall} -k ${k} -d ${dataset} -s ${shuf_str} -p 1
#             #  2>&1 >> ${i}.out &
#         done
#     done
# done

for recall in 0.98
do
    for k in 50
    do
        echo "recall=${recall}, k=${k}"
        # nohup  \
        ./search_hnsw -r ${recall} -k ${k} -d ${dataset} -p 2
        # 2>&1 >> no_shuf.out &
    done
done


echo "done"


