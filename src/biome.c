#include "SPBiome.h"

#include <stdlib.h>

void spBiomeGetTagsForPoint(SPBiomeThreadState* threadState,
                            uint16_t* tagsOut,
                            int* tagCountOut,
                            SPVec3 pointNormal,
                            SPVec3 noiseLoc,
                            double altitude,
                            double steepness,
                            double riverDistance,
                            double temperatureSummer,
                            double temperatureWinter,
                            double rainfallSummer,
                            double rainfallWinter)
{
    //*tagCountOut = threadState->getBiomeTag(threadState, "rainforest");
    //*tagsOut = 0;
}

static uint32_t terrainBaseType_coal;
static uint32_t terrainVariation_coal;

void spBiomeInit(SPBiomeThreadState* threadState) {
    terrainBaseType_coal = threadState->getTerrainBaseTypeIndex(threadState, "coal");
    terrainVariation_coal = threadState->getTerrainVariation(threadState, "coal");
}

SPSurfaceTypeResult spBiomeGetSurfaceTypeForPoint(SPBiomeThreadState* threadState,
                                                  SPSurfaceTypeResult incomingType,
                                                  uint16_t* tags,
                                                  int tagCount,
                                                  uint32_t* modifications,
                                                  int modificationCount,
                                                  uint32_t fillGameObjectTypeIndex,
                                                  int16_t digFillOffset,
                                                  uint32_t* variations,
                                                  SPVec3 pointNormal, 
                                                  SPVec3 noiseLoc, 
                                                  double baseAltitude,
                                                  double steepness,
                                                  double riverDistance,
                                                  int seasonIndex)
{
    SPSurfaceTypeResult result = incomingType;


    SPVec3 scaledNoiseLoc = spVec3Mul(noiseLoc, 45999.0);
	double noiseValue = spNoiseGet(threadState->spNoise1, scaledNoiseLoc, 2);

	SPVec3 scaledNoiseLocSmallScale = spVec3Mul(noiseLoc, 834567.0);
	double noiseValueSmall = spNoiseGet(threadState->spNoise1, scaledNoiseLocSmallScale, 2);

    SPVec3 scaledNoiseMedScale = spVec3Mul(noiseLoc, 92273.0);
    double noiseValueMed = spNoiseGet(threadState->spNoise1, scaledNoiseMedScale, 2);

    SPVec3 scaledNoiseLocLargeScale = spVec3Mul(noiseLoc, 8073.0);
	double noiseValueLarge = spNoiseGet(threadState->spNoise1, scaledNoiseLocLargeScale, 2);

    bool hasCoal = (noiseValueMed > 0.2 && noiseValue < 0.05 + noiseValueSmall * 0.1);

    bool isBeach = ((baseAltitude + noiseValue * 0.00000005 + noiseValueLarge * 0.0000005) < 0.0000001);
    bool isRock = (steepness > 2.0 + noiseValue * 0.5);
    bool isCoal = hasCoal && !isRock && (steepness > 1.8 + noiseValue * 0.7 - (1.0 - riverDistance) * (1.0 - riverDistance) * 0.7);

    if(!isBeach && isCoal) {
        result.surfaceBaseType = terrainBaseType_coal;
		SPSurfaceTypeDefault defaults = threadState->getSurfaceDefaultsForBaseType(threadState, result.surfaceBaseType);
		result.materialIndex = defaults.materialIndex;
		result.decalTypeIndex = defaults.decalGroupIndex;
		result.pathDifficultyIndex = defaults.pathDifficultyIndex;
    }

    if(hasCoal) {
        variations[result.variationCount++] = terrainVariation_coal;
    }
    return result;
}