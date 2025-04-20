import { VStack, Box, HStack, ScrollView } from "@gluestack-ui/themed";

import React, { useEffect, useState } from "react";
import { EyeIcon, EyeOffIcon } from "lucide-react-native";
const Events = () => {
  return (
    <ScrollView>
      <Box className="justify-center h-80 flex flex-col gap-5">
        {[1, 2, 3].map((value, index) => {
          return (
            <VStack key={index} space="lg" reversed={false}>
              <Box className="w-full bg-primary-300  p-5 ">
                <HStack space="md">
                  <Box className="bg-red-300 w-full"></Box>
                  <Box className="bg-red-300 h-full w-full"></Box>
                </HStack>
              </Box>
            </VStack>
          );
        })}
      </Box>
    </ScrollView>
  );
};
export default Events;
