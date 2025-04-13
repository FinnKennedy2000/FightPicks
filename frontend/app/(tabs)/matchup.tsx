import { StyleSheet, Button } from "react-native";
import { ThemedText } from "@/components/ThemedText";
import { ThemedView } from "@/components/ThemedView";
import { RouteProp } from "@react-navigation/native";
import { StackNavigationProp } from "@react-navigation/stack";

type MatchupScreenProps = {
  route: RouteProp<
    {
      params: {
        matchup: { fighter1: { name: string }; fighter2: { name: string } };
      };
    },
    "params"
  >;
  navigation: StackNavigationProp<any>;
};

export default function MatchupScreen({ route }: MatchupScreenProps) {
  const { matchup } = route.params; // Assume matchup data is passed as a parameter

  return (
    <ThemedView style={styles.container}>
      <ThemedText type="title">
        {matchup.fighter1.name} vs {matchup.fighter2.name}
      </ThemedText>
      <Button
        title={`Predict ${matchup.fighter1.name}`}
        onPress={() => {
          /* Prediction logic */
        }}
      />
      <Button
        title={`Predict ${matchup.fighter2.name}`}
        onPress={() => {
          /* Prediction logic */
        }}
      />
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  container: {
    padding: 20,
  },
});
