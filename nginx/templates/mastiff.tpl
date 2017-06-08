location ~ ^/(js|css)/(mastiff|mastiffApp)/(.*)$ {
    alias $projDir/$2/$1/dist/$3;
}